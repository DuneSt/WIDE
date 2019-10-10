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
		'toggleMethodsOrVariables'
	],
	#category : #'WIDE-Model-Core'
}

{ #category : #'as yet unclassified' }
WIDEBrowserModelStrategy >> classNextStepClass [
	self isShowingProtocols
		ifTrue: [ ^ WIDEProtocolStep ].
	self isShowingVariables
		ifTrue: [ ^ WIDEVariableStep ].
	self error: 'Must be methods or variables'
]

{ #category : #'as yet unclassified' }
WIDEBrowserModelStrategy >> initialize [
	super initialize.
	self showProtocols
]

{ #category : #'as yet unclassified' }
WIDEBrowserModelStrategy >> isShowingProtocols [
	^ toggleMethodsOrVariables = #methods
]

{ #category : #'as yet unclassified' }
WIDEBrowserModelStrategy >> isShowingVariables [
	^ toggleMethodsOrVariables = #variables
]

{ #category : #'as yet unclassified' }
WIDEBrowserModelStrategy >> showProtocols [
	toggleMethodsOrVariables := #methods
]

{ #category : #'as yet unclassified' }
WIDEBrowserModelStrategy >> showVariables [
	toggleMethodsOrVariables := #variables
]
