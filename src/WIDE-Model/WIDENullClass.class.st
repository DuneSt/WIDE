"
I am the implementation of null design pattern.

I am used to model the fact that no class is selected in a WIDEBrowserState.
"
Class {
	#name : #WIDENullClass,
	#superclass : #Object,
	#category : #'WIDE-Model'
}

{ #category : #operations }
WIDENullClass >> >> aSelector [
	WIDENullClassError signal
]

{ #category : #accessing }
WIDENullClass >> organization [
	^ WIDENullOrganization new
]
