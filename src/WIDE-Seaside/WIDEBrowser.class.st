"
I am the seaside browser able to display a WIDEBrowserModel
"
Class {
	#name : #WIDEBrowser,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'browserModel',
		'listComponents',
		'toolbarComponent',
		'pathViewsComponent'
	],
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #accessing }
WIDEBrowser >> browserModel [
	^ browserModel
]

{ #category : #accessing }
WIDEBrowser >> browserModel: anObject [
	browserModel := anObject
]

{ #category : #hooks }
WIDEBrowser >> children [
	^ self listComponents, { self toolbarComponent. self pathViewsComponent }
]

{ #category : #rendering }
WIDEBrowser >> createListForStep: aWIDEPathStep on: html [
	html mdlCell
		size: 3;
		with: [ html div
				class: 'browser-list';
				with: [ html
						render:
							((MDLNestedList
								elements: aWIDEPathStep allElementsSorted
								children: [ :packageOrClass | #() ])
								selectedEntity: aWIDEPathStep selectedElement;
								beCompact;
								format: #name;
								onClickJs: [ :element | 
									html jQuery ajax
										script:
											(self
												refreshScriptOn: html
												withCallback: [ aWIDEPathStep selectedElement: element ]) ];
								withResearchField;
								filterPseudoRegex;
								childrenSortBlock: [ :child1 :child2 | child1 name < child2 name ];
								yourself) ] ]
]

{ #category : #initialization }
WIDEBrowser >> initialize [
	super initialize.
	self browserModel: WIDEBrowserModel new.
	self toolbarComponent: (WIDEToolbarComponent browser: self).
	self listComponents: OrderedCollection new.
	self
		pathViewsComponent: (WIDEPathViews browserModel: self browserModel).
	self pathViewsComponent
		addSegmentView:
			(MonacoComponent
				code: [ [ self browserModel selectedMethod sourceCode ]
						on: Error
						do: [ '' ] ]
				language: MonacoLanguage smalltalk)
		named: 'Editor'
]

{ #category : #accessing }
WIDEBrowser >> listComponents [
	^ listComponents
]

{ #category : #accessing }
WIDEBrowser >> listComponents: anObject [
	listComponents := anObject
]

{ #category : #accessing }
WIDEBrowser >> pathViewsComponent [
	^ pathViewsComponent
]

{ #category : #accessing }
WIDEBrowser >> pathViewsComponent: anObject [
	pathViewsComponent := anObject
]

{ #category : #initialization }
WIDEBrowser >> refreshScriptOn: html withCallback: aBlock [
	^ [ :jsScript | 
	jsScript
		<<
			((html jQuery id: self id) parent load
				html: [ :ajaxHtml | 
					aBlock value.
					ajaxHtml render: self ]) ]
]

{ #category : #rendering }
WIDEBrowser >> renderContentOn: html [
	self ensureId: html.
	html div
		id: self id;
		with: [ self children
				do: [ :childComponent | childComponent ensureId: html ].
			html mdlGrid
				shadow: 2;
				with: [ self browserModel path
						allStepsDo: [ :aStep | self createListForStep: aStep on: html ] ].
			html render: self toolbarComponent.
			html render: self pathViewsComponent ]
]

{ #category : #accessing }
WIDEBrowser >> strategy [
	^ self browserModel strategy
]

{ #category : #accessing }
WIDEBrowser >> toolbarComponent [
	^ toolbarComponent
]

{ #category : #accessing }
WIDEBrowser >> toolbarComponent: anObject [
	toolbarComponent := anObject
]
