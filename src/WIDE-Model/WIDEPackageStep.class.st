"
I am the package step, i will propose all package from the environment of the browser
"
Class {
	#name : #WIDEPackageStep,
	#superclass : #WIDEAbstractStep,
	#instVars : [
		'path'
	],
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEPackageStep >> allElements [ 
	^ RPackage organizer packages
]

{ #category : #accessing }
WIDEPackageStep >> browserStrategy [
	^ self path browserStrategy
]

{ #category : #hooks }
WIDEPackageStep >> nextStepClass [
	^ WIDEClassStep 
]

{ #category : #accessing }
WIDEPackageStep >> path [
	^ path
]

{ #category : #accessing }
WIDEPackageStep >> path: anObject [
	path := anObject
]

{ #category : #accessing }
WIDEPackageStep >> previousStep [
	^ self error: 'A package step does not have a previous step'
]

{ #category : #accessing }
WIDEPackageStep >> previousStep: anObject [
	self error: 'A package step does not have a previous step'
]
