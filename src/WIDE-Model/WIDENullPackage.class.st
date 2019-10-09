"
I am the implementation of null design pattern.

I am used to model the fact that no package is selected in a WIDEBrowserState.
"
Class {
	#name : #WIDENullPackage,
	#superclass : #Object,
	#category : #'WIDE-Model'
}

{ #category : #'class tags' }
WIDENullPackage >> classTags [
	^ #()
]

{ #category : #accessing }
WIDENullPackage >> classes [
	^ #()
]
