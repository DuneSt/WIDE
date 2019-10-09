"
Description
--------------------

Abstract superclass of all Seaside components of PharoOnWeb. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #WIDEComponent,
	#superclass : #WAComponent,
	#category : #'WIDE-Seaside-Core'
}

{ #category : #convenience }
WIDEComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
WIDEComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
WIDEComponent >> rootComponent [
	^ self session rootComponent
]
