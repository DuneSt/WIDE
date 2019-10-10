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
		'toggleMethodsOrVariables'
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

{ #category : #initialization }
WIDEBrowserModelStrategy >> initialize [
	super initialize.
	self showProtocols
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
WIDEBrowserModelStrategy >> showProtocols [
	toggleMethodsOrVariables := #methods.
	self model ifNotNil: [ self model toggleMethodsOrVariables ]
]

{ #category : #toggle }
WIDEBrowserModelStrategy >> showVariables [
	toggleMethodsOrVariables := #variables.
	self model toggleMethodsOrVariables
]
