Class {
	#name : #WIDEProtocolsComponent,
	#superclass : #WIDEListComponent,
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #rendering }
WIDEProtocolsComponent >> renderContentOn: html [
	self ensureId: html.
	html div
		id: self id;
		with: [ "html heading
				level: 5;
				with: 'Protocols'."
			html div
				class: 'browser-list';
				with: [ self flag: #hack.	"Not able to make work the sorting via the list."
					html
						render:
							((MDLNestedList
								elements: ((self environment protocolsFor: self browserState selectedClass) sorted: #name ascending)
								children: [ :packageOrClass | #() ])
								format: #name;
								beCompact;
								onClickJs: [ :entity | 
									html jQuery ajax script: [ :jsScript |
										jsScript << (((html jQuery id: self browser methodsComponent id) load
											html: [ :ajaxHtml |
												self browserState selectProtocol: entity.
												ajaxHtml render: self browser methodsComponent ])).
										jsScript << ((html jQuery id: self browser toolbarComponent id) load
											html: [ :ajaxHtml | ajaxHtml render: self browser toolbarComponent ])
										 ] ];
								withResearchField;
								filterPseudoRegex;
								yourself) ] ]
]
