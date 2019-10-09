Class {
	#name : #WIDEEnvironment,
	#superclass : #Object,
	#category : #'WIDE-Model'
}

{ #category : #accessing }
WIDEEnvironment >> classesFor: aPackage [
	^ aPackage ifNil: [ #() ] ifNotNil: [ aPackage classes asArray ]
]

{ #category : #accessing }
WIDEEnvironment >> methodsFor: aClass under: aProtocol [
	aClass
		ifNil: [ ^ #() ].
		
	aProtocol
		ifNil: [ ^ aClass methods asArray ].
	
	^ aProtocol methods collect: [ :selector | aClass >> selector ]
]

{ #category : #accessing }
WIDEEnvironment >> packages [
	^ RPackage organizer packages
]

{ #category : #accessing }
WIDEEnvironment >> protocolsFor: aClass [
	^ aClass ifNil: [ #() ] ifNotNil: [ aClass organization protocols ]
]

{ #category : #accessing }
WIDEEnvironment >> tagsFor: aPackage [
	^ aPackage classTags
]
