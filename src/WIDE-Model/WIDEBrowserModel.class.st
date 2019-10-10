"
I am the model for the whole browser. I have a strategy (WIDEBrowserModelStrategy) and a path (WIDEPath) to show what to display
"
Class {
	#name : #WIDEBrowserModel,
	#superclass : #WIDEObject,
	#instVars : [
		'strategy',
		'path'
	],
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEBrowserModel >> initialize [ 
	super initialize.
	self path: WIDEPath new
]

{ #category : #accessing }
WIDEBrowserModel >> path [
	^ path
]

{ #category : #accessing }
WIDEBrowserModel >> path: aPath [
	path := aPath.
	aPath browser: self
]

{ #category : #accessing }
WIDEBrowserModel >> strategy [
	^ strategy
]

{ #category : #accessing }
WIDEBrowserModel >> strategy: anObject [
	strategy := anObject
]
