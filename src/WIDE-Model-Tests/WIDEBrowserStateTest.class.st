"
A WIDEBrowserStateTest is a test class for testing the behavior of WIDEBrowserState
"
Class {
	#name : #WIDEBrowserStateTest,
	#superclass : #TestCase,
	#category : #'WIDE-Model-Tests'
}

{ #category : #test }
WIDEBrowserStateTest >> testInitialize [
	| browserState |
	browserState := WIDEBrowserState new.
	
	self assert: browserState selectedPackage class equals: WIDENullPackage.
	self assert: browserState selectedClass class equals: WIDENullClass.
	self assert: browserState selectedProtocol class equals: WIDENullProtocol.
	self assert: browserState selectedMethod class equals: WIDENullMethod.
]

{ #category : #test }
WIDEBrowserStateTest >> testSelectClass [
	| browserState |
	browserState := WIDEBrowserState new.
	
	browserState selectClass: WIDEBrowserStateTest.
	
	self assert: browserState selectedPackage class equals: WIDENullPackage.
	self assert: browserState selectedClass equals: WIDEBrowserStateTest.
	self assert: browserState selectedProtocol class equals: WIDENullProtocol.
	self assert: browserState selectedMethod class equals: WIDENullMethod.
]

{ #category : #test }
WIDEBrowserStateTest >> testSelectMethod [
	| browserState |
	browserState := WIDEBrowserState new.
	
	browserState selectMethod: WIDEBrowserStateTest >> #testSelectMethod.
	
	self assert: browserState selectedPackage class equals: WIDENullPackage.
	self assert: browserState selectedClass class equals: WIDENullClass.
	self assert: browserState selectedProtocol class equals: WIDENullProtocol.
	self assert: browserState selectedMethod equals: WIDEBrowserStateTest >> #testSelectMethod.
]

{ #category : #test }
WIDEBrowserStateTest >> testSelectPackage [
	| browserState |
	browserState := WIDEBrowserState new.
	
	browserState selectPackage: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	
	self assert: browserState selectedPackage equals: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	self assert: browserState selectedClass class equals: WIDENullClass.
	self assert: browserState selectedProtocol class equals: WIDENullProtocol.
	self assert: browserState selectedMethod class equals: WIDENullMethod.
]

{ #category : #test }
WIDEBrowserStateTest >> testSelectProtocol [
	| browserState |
	browserState := WIDEBrowserState new.
	
	browserState selectProtocol: #foo.
	
	self assert: browserState selectedPackage class equals: WIDENullPackage.
	self assert: browserState selectedClass class equals: WIDENullClass.
	self assert: browserState selectedProtocol  equals: #foo.
	self assert: browserState selectedMethod class equals: WIDENullMethod.
]

{ #category : #test }
WIDEBrowserStateTest >> testUnselectClass [
	| browserState |
	browserState := WIDEBrowserState new.
	
	browserState selectPackage: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	browserState selectClass: WIDEBrowserStateTest.
	browserState selectProtocol: #test.
	browserState selectMethod: WIDEBrowserStateTest >> #testUnselectPackage.
	
	browserState unselectClass.
	
	self assert: browserState selectedPackage equals: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	self assert: browserState selectedClass class equals: WIDENullClass.
	self assert: browserState selectedProtocol class equals: WIDENullProtocol.
	self assert: browserState selectedMethod class equals: WIDENullMethod.
]

{ #category : #test }
WIDEBrowserStateTest >> testUnselectMethod [
	| browserState |
	browserState := WIDEBrowserState new.
	
	browserState selectPackage: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	browserState selectClass: WIDEBrowserStateTest.
	browserState selectProtocol: #test.
	browserState selectMethod: WIDEBrowserStateTest >> #testUnselectPackage.
	
	browserState unselectMethod.
	
	self assert: browserState selectedPackage equals: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	self assert: browserState selectedClass equals: WIDEBrowserStateTest.
	self assert: browserState selectedProtocol equals: #test.
	self assert: browserState selectedMethod class equals: WIDENullMethod.
]

{ #category : #test }
WIDEBrowserStateTest >> testUnselectPackage [
	| browserState |
	browserState := WIDEBrowserState new.
	
	browserState selectPackage: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	browserState selectClass: WIDEBrowserStateTest.
	browserState selectProtocol: #test.
	browserState selectMethod: WIDEBrowserStateTest >> #testUnselectPackage.
	
	browserState unselectPackage.
	
	self assert: browserState selectedPackage class equals: WIDENullPackage.
	self assert: browserState selectedClass class equals: WIDENullClass.
	self assert: browserState selectedProtocol class equals: WIDENullProtocol.
	self assert: browserState selectedMethod class equals: WIDENullMethod.
]

{ #category : #test }
WIDEBrowserStateTest >> testUnselectProtocol [
	| browserState |
	browserState := WIDEBrowserState new.
	
	browserState selectPackage: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	browserState selectClass: WIDEBrowserStateTest.
	browserState selectProtocol: #test.
	browserState selectMethod: WIDEBrowserStateTest >> #testUnselectPackage.
	
	browserState unselectProtocol.
	
	self assert: browserState selectedPackage equals: (RPackage organizer packageNamed: 'WIDE-Model-Tests').
	self assert: browserState selectedClass equals: WIDEBrowserStateTest.
	self assert: browserState selectedProtocol class equals: WIDENullProtocol.
	self assert: browserState selectedMethod class equals: WIDENullMethod.
]
