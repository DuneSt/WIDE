Class {
	#name : #WIDESendersTestPage,
	#superclass : #WIDEPage,
	#category : #'WIDE-Seaside-Pages'
}

{ #category : #accessing }
WIDESendersTestPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ 'Senders test'
]

{ #category : #accessing }
WIDESendersTestPage class >> priority [
	^ 1
]

{ #category : #rendering }
WIDESendersTestPage >> renderContentOn: html [
	html render: (WIDEMethodsQueryBrowser methods: #initialize senders)
]
