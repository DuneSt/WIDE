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

{ #category : #api }
WIDEBrowserState >> selectClass: aClass [
	self selectedClass: aClass.
	self unselectProtocol.
	self unselectMethod
]

{ #category : #api }
WIDEBrowserState >> selectMethod: aMethod [
	self selectedMethod: aMethod
]

{ #category : #api }
WIDEBrowserState >> selectPackage: aPackage [
	self selectedPackage: aPackage.
	self unselectClass.
	self unselectProtocol.
	self unselectMethod
]

{ #category : #api }
WIDEBrowserState >> selectProtocol: aProtocol [
	self selectedProtocol: aProtocol.
	self unselectMethod
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
	self selectedClass: nil
]

{ #category : #api }
WIDEBrowserState >> unselectMethod [
	self selectedMethod: nil
]

{ #category : #api }
WIDEBrowserState >> unselectPackage [
	self selectedPackage: nil
]

{ #category : #api }
WIDEBrowserState >> unselectProtocol [
	self selectedProtocol: nil
]
