Class {
	#name : #WIDETabComponent,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'name',
		'wrappedComponent'
	],
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #'instance creation' }
WIDETabComponent class >> name: name wrappedComponent: wrappedComponent [
	^ self new
		name: name;
		wrappedComponent: wrappedComponent;
		yourself
]

{ #category : #accessing }
WIDETabComponent >> name [
	^ name
]

{ #category : #accessing }
WIDETabComponent >> name: anObject [
	name := anObject
]

{ #category : #rendering }
WIDETabComponent >> renderContentOn: html [
	CmCommandGroup forMDL
		register: (CmBlockCommand new
						block: [ Transcript show: 'coucou';cr ];
						name: 'Coucou';
						asMDLCommand);
		register: (CmBlockCommand new
						block: [ Transcript show: 'caca';cr ];
						name: 'Caca';
						asMDLCommand);
		asMDLMenuOn: html.
	html render: self wrappedComponent
]

{ #category : #accessing }
WIDETabComponent >> wrappedComponent [
	^ wrappedComponent
]

{ #category : #accessing }
WIDETabComponent >> wrappedComponent: anObject [
	wrappedComponent := anObject
]
