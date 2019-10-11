"
I am the model for the whole browser. I have a strategy (WIDEBrowserModelStrategy) and a path (WIDEPath) to show what to display
"
Class {
	#name : #WIDEBrowserModel,
	#superclass : #WIDEObject,
	#instVars : [
		'strategy',
		'path',
		'environment'
	],
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEBrowserModel >> environment [
	^ environment
]

{ #category : #accessing }
WIDEBrowserModel >> environment: anObject [
	environment := anObject
]

{ #category : #initialize }
WIDEBrowserModel >> initialize [
	super initialize.
	self path: WIDEPath new.
	self strategy: WIDEBrowserModelStrategy new.
	self environment: WIDEEnvironment new
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
WIDEBrowserModel >> selectedMethod [
	^ self path selectedMethod
]

{ #category : #accessing }
WIDEBrowserModel >> strategy [
	^ strategy
]

{ #category : #accessing }
WIDEBrowserModel >> strategy: anObject [
	strategy := anObject.
	strategy model: self
]

{ #category : #accessing }
WIDEBrowserModel >> toggleInstanceOrClass [
	self path toggleInstanceOrClass
]

{ #category : #accessing }
WIDEBrowserModel >> toggleMethodsOrVariables [
	self path toggleMethodsOrVariables
]
