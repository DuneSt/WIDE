Class {
	#name : #WIDEMethodsQueryBrowser,
	#superclass : #WIDEQueryBrowser,
	#instVars : [
		'methods'
	],
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #'instance creation' }
WIDEMethodsQueryBrowser class >> methods: methods [
	^ self new
		methods: methods;
		yourself
]

{ #category : #accessing }
WIDEMethodsQueryBrowser >> methods [
	^ methods
]

{ #category : #accessing }
WIDEMethodsQueryBrowser >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
WIDEMethodsQueryBrowser >> rows [
	^ self methods collect: [ :method |
		{ 
			method methodClass name.
			method selector.
			method package name
		} ]
]

{ #category : #accessing }
WIDEMethodsQueryBrowser >> tableHeader [
	^ {'Class' . 'Method' . 'Package'}
]
