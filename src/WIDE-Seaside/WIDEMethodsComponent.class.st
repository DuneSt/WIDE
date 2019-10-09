Class {
	#name : #WIDEMethodsComponent,
	#superclass : #WIDEBrowserComponent,
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #rendering }
WIDEMethodsComponent >> renderContentOn: html [
	self ensureId: html.
	html div
		id: self id;
		with: [ html heading
				level: 5;
				with: 'Methods'.
			html div
				class: 'browser-list';
				with: [ 
					 self flag: #hack.	"Not able to make work the sorting via the list."
					html
						render:
							((MDLNestedList
								elements: ((self environment methodsFor: self browserState selectedClass under: self browserState selectedProtocol) sorted: #selector ascending)
								children: [ :packageOrClass | #() ])
								format: #selector;
								"onClickJs: [ :entity |  ];" flag: #TODO; "Display code!"
								beCompact;
								withResearchField;
								filterPseudoRegex;
								childrenSortBlock: [ :child1 :child2 | child1 name < child2 name ];
								yourself) ] ]
]
