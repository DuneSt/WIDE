Class {
	#name : #WIDENewBrowser,
	#superclass : #WIDEPage,
	#instVars : [
		'browserModel',
		'listComponents',
		'toolbarComponent',
		'id'
	],
	#category : #'WIDE-Seaside-Pages'
}

{ #category : #accessing }
WIDENewBrowser class >> pageName [
	^ 'NewBrowser'
]

{ #category : #accessing }
WIDENewBrowser class >> priority [
	^ 0
]

{ #category : #accessing }
WIDENewBrowser >> browserModel [
	^ browserModel
]

{ #category : #accessing }
WIDENewBrowser >> browserModel: anObject [
	browserModel := anObject
]

{ #category : #hooks }
WIDENewBrowser >> children [
	^ self listComponents", { self toolbarComponent }"
]

{ #category : #rendering }
WIDENewBrowser >> createListForStep: aWIDEPathStep on: html [
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
										script: [ :jsScript | 
											jsScript
												<<
													((html jQuery id: id) parent load
														html: [ :ajaxHtml | 
															aWIDEPathStep selectedElement: element.
															ajaxHtml render: self ]) ] ];
								withResearchField;
								filterPseudoRegex;
								childrenSortBlock: [ :child1 :child2 | child1 name < child2 name ];
								yourself) ] ]
]

{ #category : #initialization }
WIDENewBrowser >> initialize [
	super initialize.
	self browserModel: (WIDEBrowserModel new).
	"self toolbarComponent: (WIDEToolbarComponent browser: self)."
	self listComponents: OrderedCollection new.

]

{ #category : #accessing }
WIDENewBrowser >> listComponents [
	^ listComponents
]

{ #category : #accessing }
WIDENewBrowser >> listComponents: anObject [
	listComponents := anObject
]

{ #category : #rendering }
WIDENewBrowser >> renderContentOn: html [
	html div
		id: (id := html nextId);
		with: [ self children
				do: [ :childComponent | childComponent ensureId: html ].
			html mdlGrid
				shadow: 2;
				with: [ self browserModel path
						allStepsDo: [ :aStep | self createListForStep: aStep on: html ] ].
			"html render: self toolbarComponent."
			html mdlGrid
				shadow: 2;
				with: [ html mdlCell
						size: 12;
						with: [ html
								render:
									(MonacoComponent
										code:
											([ self browserModel selectedMethod sourceCode ]
												on: Error
												do: [ '' ])
										language: MonacoLanguage smalltalk) ] ] ]
]

{ #category : #accessing }
WIDENewBrowser >> toolbarComponent [
	^ toolbarComponent
]

{ #category : #accessing }
WIDENewBrowser >> toolbarComponent: anObject [
	toolbarComponent := anObject
]
