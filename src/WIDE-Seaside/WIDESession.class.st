"
Description
--------------------

Simple session for the PharoOnWeb. I save the root component to help with the application management. Each components will be able to access the root component via myself.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rootComponent:		<aComponent>		The root component of the demo. Should be an instance of the root component of the application.

"
Class {
	#name : #WIDESession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent',
		'browserState'
	],
	#category : #'WIDE-Seaside-Core'
}

{ #category : #accessing }
WIDESession >> browserState [
	^ browserState ifNil: [ browserState := WIDEBrowserState new ]
]

{ #category : #accessing }
WIDESession >> browserState: anObject [
	browserState := anObject
]

{ #category : #accessing }
WIDESession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
WIDESession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]
