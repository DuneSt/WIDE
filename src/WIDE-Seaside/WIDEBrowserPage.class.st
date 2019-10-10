Class {
	#name : #WIDEBrowserPage,
	#superclass : #WIDEPage,
	#category : #'WIDE-Seaside-Pages'
}

{ #category : #accessing }
WIDEBrowserPage class >> pageName [
	^ 'Browser'
]

{ #category : #accessing }
WIDEBrowserPage class >> priority [
	^ 0
]

{ #category : #rendering }
WIDEBrowserPage >> renderContentOn: html [
	html render: WIDEBrowser new
]
