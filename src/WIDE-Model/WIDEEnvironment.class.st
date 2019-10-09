Class {
	#name : #WIDEEnvironment,
	#superclass : #Object,
	#category : #'WIDE-Model'
}

{ #category : #accessing }
WIDEEnvironment >> classesFor: aPackage [
	^ aPackage classes asArray
]

{ #category : #accessing }
WIDEEnvironment >> methodsFor: aClass under: aProtocol [
	[
		^ aProtocol methods collect: [ :selector | aClass >> selector ]
	] on: WIDENullClassError do: [ ^ aClass methods ]
]

{ #category : #accessing }
WIDEEnvironment >> packages [
	^ RPackage organizer packages
]

{ #category : #accessing }
WIDEEnvironment >> protocolsFor: aClass [
	^ aClass organization protocols
]

{ #category : #accessing }
WIDEEnvironment >> tagsFor: aPackage [
	^ aPackage classTags
]
