"
Description
--------------------

I am an abstract component. My subclasses represent the main pages of the application.

Each page should have a name that will be used in the URLs and a priority for the menus.
"
Class {
	#name : #WIDEPage,
	#superclass : #WIDEComponent,
	#category : #'WIDE-Seaside-Core'
}

{ #category : #testing }
WIDEPage class >> isAbstract [
	^ self = WIDEPage
]

{ #category : #accessing }
WIDEPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
WIDEPage class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
WIDEPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
WIDEPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
WIDEPage >> pathName [
	^ self class pathName
]
