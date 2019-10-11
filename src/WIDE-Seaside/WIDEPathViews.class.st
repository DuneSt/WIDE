Class {
	#name : #WIDEPathViews,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'browserModel',
		'segmentViews',
		'activeView'
	],
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #'instance creation' }
WIDEPathViews class >> browserModel: aWIDEBrowserModel [ 
	^ self new
		browserModel: aWIDEBrowserModel ;
		yourself
]

{ #category : #accessing }
WIDEPathViews >> activeView [
	^ activeView
]

{ #category : #accessing }
WIDEPathViews >> activeView: anObject [
	activeView := anObject
]

{ #category : #adding }
WIDEPathViews >> addSegmentView: aComponent [
	self segmentViews add: aComponent.
	(self segmentViews size = 1 and: [ self activeView isNil ])
		ifTrue: [ self activeView: self segmentViews first ]
]

{ #category : #adding }
WIDEPathViews >> addSegmentView: aComponent named: aString [
	self addSegmentView: (WIDETabComponent name: aString wrappedComponent: aComponent)
]

{ #category : #accessing }
WIDEPathViews >> browserModel [
	^ browserModel
]

{ #category : #accessing }
WIDEPathViews >> browserModel: anObject [
	browserModel := anObject
]

{ #category : #initialization }
WIDEPathViews >> initialize [
	super initialize.
	self segmentViews: OrderedCollection new
]

{ #category : #rendering }
WIDEPathViews >> renderContentOn: html [
	self renderHeaderOn: html.
	html mdlGrid
				shadow: 2;
				with: [ html mdlCell
						size: 12;
						with: self activeView ]
]

{ #category : #rendering }
WIDEPathViews >> renderHeaderOn: html [
	html mdlTabs
		with: [ html
				mdlTabBar: [ self segmentViews
						do: [ :segmentView | 
							html mdlTab
								callback: [ self activeView: segmentView ];
								isActiveIf: segmentView = self activeView;
								with: segmentView name ] ] ]
]

{ #category : #accessing }
WIDEPathViews >> segmentViews [
	^ segmentViews
]

{ #category : #accessing }
WIDEPathViews >> segmentViews: anObject [
	segmentViews := anObject
]
