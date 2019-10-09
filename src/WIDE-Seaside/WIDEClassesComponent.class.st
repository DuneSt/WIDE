Class {
	#name : #WIDEClassesComponent,
	#superclass : #WIDEBrowserComponent,
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #rendering }
WIDEClassesComponent >> renderContentOn: html [
	self ensureId: html.
	html div
		id: self id;
		with: [ html heading
				level: 5;
				with: 'Classes'.
			html div
				class: 'browser-list';
				with: [ 
					 self flag: #hack.	"Not able to make work the sorting via the list."
					html
						render:
							((MDLNestedList
								elements: ((self environment classesFor: self browserState selectedPackage) sorted: #name ascending)
								children: [ :packageOrClass | #() ])
								beCompact;
								format: #name;
								onClickJs: [ :entity | 
									html jQuery ajax script: [ :jsScript |
										jsScript << ((html jQuery id: self browser protocolsComponent id) load
											html: [ :ajaxHtml |
												self browserState selectClass: entity.
												ajaxHtml render: self browser protocolsComponent ]).
										jsScript << ((html jQuery id: self browser methodsComponent id) load
											html: [ :ajaxHtml |
												self browserState selectClass: entity.
												ajaxHtml render: self browser methodsComponent ]) ] ];
								withResearchField;
								filterPseudoRegex;
								childrenSortBlock: [ :child1 :child2 | child1 name < child2 name ];
								yourself) ] ]
]
