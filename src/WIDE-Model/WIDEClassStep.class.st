"
I am the class step, i will propose all classes from the previous step (PackageStep)
"
Class {
	#name : #WIDEClassStep,
	#superclass : #WIDEAbstractStep,
	#category : #'WIDE-Model-Core'
}

{ #category : #accessing }
WIDEClassStep >> allElements [ 
	^ (self browserEnvironment classesFor: self selectedPackage)
		collect: [ :class | self browserStrategy getMetaLevel: class ]
]

{ #category : #hooks }
WIDEClassStep >> nextStepClass [
	^ self browserStrategy classNextStepClass
]

{ #category : #accessing }
WIDEClassStep >> selectedClass [
	^ self selectedElement
]

{ #category : #accessing }
WIDEClassStep >> selectedPackage [
	^ self previousStep selectedElement
]

{ #category : #accessing }
WIDEClassStep >> toggleInstanceOrClass [
	self selectedElement
		ifNotNil: [ self selectedElement: (self browserStrategy getMetaLevel: self selectedElement) ]
]

{ #category : #accessing }
WIDEClassStep >> toggleMethodsOrVariables [
	self selectedElement
		ifNotNil: [ self selectedElement: self selectedElement ]
]
