"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #WIDEHeader,
	#superclass : #WIDEComponent,
	#category : #'WIDE-Seaside-Core'
}

{ #category : #accessing }
WIDEHeader >> possiblePages [
	^ WIDEPage pagesToDisplay
]

{ #category : #rendering }
WIDEHeader >> renderContentOn: html [
	html mdlLayoutHeader
		with: [ "html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ ""Just refresh"" ];
						with: [ html
								mdlLayoutTitle: 'A web IDE for Pharo.' ].
					html mdlLayoutSpacer.
					html text: 'Version 0.0.0'. ]".
			html
				mdlLayoutTabBar: [ self possiblePages
						do: [ :aClass | 
							html mdlLayoutTab
								callback: [ self displayInstanceOf: aClass ];
								isActiveIf: aClass = self rootComponent componentToDisplay class;
								with: aClass pageName ] ] ]
]
