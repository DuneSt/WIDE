Class {
	#name : #WIDEPackagesComponent,
	#superclass : #WIDEListComponent,
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #rendering }
WIDEPackagesComponent >> renderContentOn: html [
	self ensureId: html.
	html div
		id: self id;
		with: [ html heading
				level: 5;
				with: 'Packages'.
			html div
				class: 'browser-list';
				with: [ self flag: #hack.	"Not able to make work the sorting via the list."
					html
						render:
							((MDLNestedList
								elements: (self environment packages sorted: #name ascending)
								children: [ :packageOrClass | 
							packageOrClass class = RPackage
								ifTrue: [ self environment tagsFor: packageOrClass ]
								ifFalse: [ #() ] ])
								format: #name;
								beCompact;
								onClickJs: [ :entity | 
									html jQuery ajax script: [ :jsScript |
										jsScript << ((html jQuery id: self browser classesComponent id) load
											html: [ :ajaxHtml |
												self browserState selectPackage: entity.
												ajaxHtml render: self browser classesComponent ]).
										jsScript << ((html jQuery id: self browser protocolsComponent id) load
											html: [ :ajaxHtml |
												ajaxHtml render: self browser protocolsComponent ]).
										jsScript << ((html jQuery id: self browser methodsComponent id) load
											html: [ :ajaxHtml |
												ajaxHtml render: self browser methodsComponent ]).
										jsScript << ((html jQuery id: self browser toolbarComponent id) load
											html: [ :ajaxHtml | ajaxHtml render: self browser toolbarComponent ])
									 ] ];
								withResearchField;
								filterPseudoRegex;
								yourself) ] ]
]
