Class {
	#name : #WIDEBrowserComponent,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'browser'
	],
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #'instance creation' }
WIDEBrowserComponent class >> browser: browser [
	^ self new
		browser: browser;
		yourself
]

{ #category : #accessing }
WIDEBrowserComponent >> browser [
	^ browser
]

{ #category : #accessing }
WIDEBrowserComponent >> browser: anObject [
	browser := anObject
]

{ #category : #accessing }
WIDEBrowserComponent >> browserStrategy [
	^ self browser strategy
]

{ #category : #accessing }
WIDEBrowserComponent >> environment [
	^ self browser environment
]
