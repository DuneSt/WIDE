"
I am the WIDE browser strategy to keep global state of the model.

I store:
	-WIDEEnvironment
	-WIDELevel
"
Class {
	#name : #WIDEBrowserModelStrategy,
	#superclass : #WIDEObject,
	#instVars : [
		'model',
		'toggleMethodsOrVariables',
		'toggleInstanceOrClassSide'
	],
	#category : #'WIDE-Model-Core'
}

{ #category : #toggle }
WIDEBrowserModelStrategy >> classNextStepClass [
	self isShowingProtocols
		ifTrue: [ ^ WIDEProtocolStep ].
	self isShowingVariables
		ifTrue: [ ^ WIDEVariableStep ].
	self error: 'Must be methods or variables'
]

{ #category : #toggle }
WIDEBrowserModelStrategy >> getMetaLevel: class [
	"I return the meta-level of #class depending of my state (either instance or class side)."
	self isShowingInstanceSide
		ifTrue: [ ^ class instanceSide ].
	self isShowingClassSide
		ifTrue: [ ^ class classSide ].
		
	self error: 'Must be instance or class side'
]

{ #category : #initialization }
WIDEBrowserModelStrategy >> initialize [
	super initialize.
	self showProtocols.
	self showInstanceSide
]

{ #category : #testing }
WIDEBrowserModelStrategy >> isShowingClassSide [
	^ toggleInstanceOrClassSide = #class
]

{ #category : #testing }
WIDEBrowserModelStrategy >> isShowingInstanceSide [
	^ toggleInstanceOrClassSide = #instance
]

{ #category : #testing }
WIDEBrowserModelStrategy >> isShowingProtocols [
	^ toggleMethodsOrVariables = #methods
]

{ #category : #testing }
WIDEBrowserModelStrategy >> isShowingVariables [
	^ toggleMethodsOrVariables = #variables
]

{ #category : #accessing }
WIDEBrowserModelStrategy >> model [
	^ model
]

{ #category : #accessing }
WIDEBrowserModelStrategy >> model: anObject [
	model := anObject
]

{ #category : #toggle }
WIDEBrowserModelStrategy >> showClassSide [
	toggleInstanceOrClassSide := #class.
	self model ifNotNil: [ self model toggleInstanceOrClass ]
]

{ #category : #toggle }
WIDEBrowserModelStrategy >> showInstanceSide [
	toggleInstanceOrClassSide := #instance.
	self model ifNotNil: [ self model toggleInstanceOrClass ]
]

{ #category : #toggle }
WIDEBrowserModelStrategy >> showProtocols [
	toggleMethodsOrVariables := #methods.
	self model ifNotNil: [ self model toggleMethodsOrVariables ]
]

{ #category : #toggle }
WIDEBrowserModelStrategy >> showVariables [
	toggleMethodsOrVariables := #variables.
	self model ifNotNil: [ self model toggleMethodsOrVariables ]
]
