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
	^ self selectedPackage classes 
]

{ #category : #accessing }
WIDEClassStep >> selectedPackage [
	^ self previousStep selectedElement
]
