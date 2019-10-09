"
Description
--------------------

TODO
"
Class {
	#name : #WIDEBrowser,
	#superclass : #WIDEPage,
	#instVars : [
		'state',
		'packagesComponent',
		'classesComponent',
		'protocolsComponent',
		'methodsComponent',
		'toolbarComponent'
	],
	#category : #'WIDE-Seaside-Pages'
}

{ #category : #accessing }
WIDEBrowser class >> pageName [
	^ 'Browser'
]

{ #category : #accessing }
WIDEBrowser class >> priority [
	^ 1
]

{ #category : #accessing }
WIDEBrowser >> browserState [
	^ self session browserState
]

{ #category : #hooks }
WIDEBrowser >> children [
	^ { self packagesComponent. self classesComponent. self protocolsComponent. self methodsComponent. self toolbarComponent }
]

{ #category : #accessing }
WIDEBrowser >> classesComponent [
	^ classesComponent
]

{ #category : #accessing }
WIDEBrowser >> classesComponent: anObject [
	classesComponent := anObject
]

{ #category : #initialization }
WIDEBrowser >> initialize [
	super initialize.
	self packagesComponent: (WIDEPackagesComponent browser: self).
	self classesComponent: (WIDEClassesComponent browser: self).
	self protocolsComponent: (WIDEProtocolsComponent browser: self).
	self methodsComponent: (WIDEMethodsComponent browser: self).
	self toolbarComponent: (WIDEToolbarComponent browser: self).
]

{ #category : #accessing }
WIDEBrowser >> methodsComponent [
	^ methodsComponent
]

{ #category : #accessing }
WIDEBrowser >> methodsComponent: anObject [
	methodsComponent := anObject
]

{ #category : #accessing }
WIDEBrowser >> packagesComponent [
	^ packagesComponent
]

{ #category : #accessing }
WIDEBrowser >> packagesComponent: anObject [
	packagesComponent := anObject
]

{ #category : #accessing }
WIDEBrowser >> protocolsComponent [
	^ protocolsComponent
]

{ #category : #accessing }
WIDEBrowser >> protocolsComponent: anObject [
	protocolsComponent := anObject
]

{ #category : #rendering }
WIDEBrowser >> renderContentOn: html [
	self children do: [ :childComponent |
		childComponent ensureId: html ].
	html mdlGrid
		shadow: 2;
		with: [ 
			html mdlCell
				size: 3;
				with: [
					html render: self packagesComponent ].
			html mdlCell
				size: 3;
				with: [ 
					html render: self classesComponent ].
			html mdlCell
				size: 3;
				with: [
					html render: self protocolsComponent ].
			html mdlCell
				size: 3;
				with: [ 
					html render: self methodsComponent ] ].
	html render: self toolbarComponent.
	html mdlGrid
		shadow: 2;
		with: [ 
			html mdlCell
				size: 12;
				with: 'Code'. ].
]

{ #category : #accessing }
WIDEBrowser >> toolbarComponent [
	^ toolbarComponent
]

{ #category : #accessing }
WIDEBrowser >> toolbarComponent: anObject [
	toolbarComponent := anObject
]
