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
	^ self selectedPackage definedClasses 
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

{ #category : #hooks }
WIDEClassStep >> toggleMethodsOrVariables [
	"Do that to refresh and so change to protocol or variable when recreating the next step"

	self selectedElement
		ifNotNil: [ self selectedElement: self selectedElement ]
]
