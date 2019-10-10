"
I am the path of the browser. I point the first step of the navigation (WIDEPackageStep)
"
Class {
	#name : #WIDEPath,
	#superclass : #WIDEObject,
	#instVars : [
		'packageStep',
		'browser'
	],
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEPath >> browser [
	^ browser
]

{ #category : #accessing }
WIDEPath >> browser: anObject [
	browser := anObject
]

{ #category : #accessing }
WIDEPath >> browserStrategy [
	^ self browser strategy
]

{ #category : #accessing }
WIDEPath >> packageStep [
	^ packageStep
]

{ #category : #accessing }
WIDEPath >> packageStep: anObject [
	packageStep := anObject
]
