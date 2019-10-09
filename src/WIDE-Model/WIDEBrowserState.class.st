Class {
	#name : #WIDEBrowserState,
	#superclass : #Object,
	#instVars : [
		'selectedPackage',
		'selectedClass',
		'selectedProtocol',
		'selectedMethod'
	],
	#category : #'WIDE-Model'
}

{ #category : #initialization }
WIDEBrowserState >> initialize [
	super initialize.
	self unselectPackage.
	self unselectClass.
	self unselectProtocol.
	self unselectMethod.
]

{ #category : #api }
WIDEBrowserState >> selectClass: aClass [
	self unselectClass.
	self selectedClass: aClass
]

{ #category : #api }
WIDEBrowserState >> selectMethod: aMethod [
	self unselectMethod.
	self selectedMethod: aMethod
]

{ #category : #api }
WIDEBrowserState >> selectPackage: aPackage [
	self unselectPackage.
	self selectedPackage: aPackage
]

{ #category : #api }
WIDEBrowserState >> selectProtocol: aProtocol [
	self unselectProtocol.
	self selectedProtocol: aProtocol.
]

{ #category : #accessing }
WIDEBrowserState >> selectedClass [
	^ selectedClass
]

{ #category : #accessing }
WIDEBrowserState >> selectedClass: anObject [
	selectedClass := anObject
]

{ #category : #accessing }
WIDEBrowserState >> selectedMethod [
	^ selectedMethod
]

{ #category : #accessing }
WIDEBrowserState >> selectedMethod: anObject [
	selectedMethod := anObject
]

{ #category : #accessing }
WIDEBrowserState >> selectedPackage [
	^ selectedPackage
]

{ #category : #accessing }
WIDEBrowserState >> selectedPackage: anObject [
	selectedPackage := anObject
]

{ #category : #accessing }
WIDEBrowserState >> selectedProtocol [
	^ selectedProtocol
]

{ #category : #accessing }
WIDEBrowserState >> selectedProtocol: anObject [
	selectedProtocol := anObject
]

{ #category : #api }
WIDEBrowserState >> unselectClass [
	self selectedClass: WIDENullClass new.
	self unselectProtocol.
	self unselectMethod
]

{ #category : #api }
WIDEBrowserState >> unselectMethod [
	self selectedMethod: WIDENullMethod new
]

{ #category : #api }
WIDEBrowserState >> unselectPackage [
	self selectedPackage: WIDENullPackage new.
	self unselectClass.
	self unselectProtocol.
	self unselectMethod
]

{ #category : #api }
WIDEBrowserState >> unselectProtocol [
	self selectedProtocol: WIDENullProtocol new.
	self unselectMethod
]
