Class {
	#name : #WIDEToolbarComponent,
	#superclass : #WIDEBrowserComponent,
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #rendering }
WIDEToolbarComponent >> renderContentOn: html [
	self ensureId: html.
	html div
		id: self id;
		with: [ 
	html mdlGrid
		with: [ 
			html mdlCell
				size: 1;
				with: [ 
					html mdlButton
					raised
						with: 'Scope' ].
			html mdlCell
				size: 2;
				shadow: 2;
				with: [ 
					self renderFlatHierarchyToogleOn: html ].
			html mdlCell
				size: 2;
				shadow: 2;
				with: [ 
					self renderInstanceSideClassSideToogleOn: html ].
			html mdlCell
				size: 2;
				shadow: 2;
				with: [ 
					self renderMethodsVariablesToggleOn: html ].
			html mdlCell
				size: 5;
				with: [ 
					html mdlButton
						raised;
						disabled: true;
						with: 'Class refs.'.
					html mdlButton
						raised;
						disabled: true;
						with: 'Implementors'.
					html mdlButton
						raised;
						disabled: true;
						with: 'Senders' ] ] ]
]

{ #category : #rendering }
WIDEToolbarComponent >> renderFlatHierarchyToogleOn: html [
	html div
		style: 'display: inline-block; width: 200px;'; flag: #TODO; "Move to stylesheet."
		with: [ html radioGroup
				selected: true;
				with: [ :group | 
					html mdlRadioContainer
						for: html nextId;
						disabled: false;
						rippleEffect;
						with: [ group mdlRadioButton
								id: html lastId;
								value: true; flag: #TODO. "Use browser state instead"
							html mdlRadioLabel: [ html text: 'Flat' ] ].
					html mdlRadioContainer
						for: html nextId;
						rippleEffect;
						with: [ group mdlRadioButton
								id: html lastId;
								value: false; flag: #TODO. "Use browser state instead"
							html mdlRadioLabel: [ html text: 'Hierarchy' ] ] ] ]
]

{ #category : #rendering }
WIDEToolbarComponent >> renderInstanceSideClassSideToogleOn: html [
	html div
		style: 'display: inline-block; width: 200px;'; flag: #TODO; "Move to stylesheet."
		with: [ html radioGroup
				selected: true;
				with: [ :group | 
					html mdlRadioContainer
						for: html nextId;
						rippleEffect;
						with: [ group mdlRadioButton
								id: html lastId;
								value: true; flag: #TODO. "Use browser state instead"
							html mdlRadioLabel: [ html text: 'Inst. side' ] ].
					html mdlRadioContainer
						for: html nextId;
						rippleEffect;
						with: [ group mdlRadioButton
								id: html lastId;
								value: false; flag: #TODO. "Use browser state instead"
							html mdlRadioLabel: [ html text: 'Class side' ] ] ] ]
]

{ #category : #rendering }
WIDEToolbarComponent >> renderMethodsVariablesToggleOn: html [
	html div
		style: 'display: inline-block; width: 200px;';
		flag: #TODO;
		"Move to stylesheet."
			with: [ html radioGroup
				selected: true;
				with: [ :group | 
					html mdlRadioContainer
						for: html nextId;
						rippleEffect;
						with: [ group mdlRadioButton
								id: html lastId;
								onClick: (html jQuery ajax callback: [ self browserStrategy showProtocols ]);
								value: self browserStrategy isShowingProtocols.
							html mdlRadioLabel: [ html text: 'Methods' ] ].
					html mdlRadioContainer
						for: html nextId;
						rippleEffect;
						with: [ group mdlRadioButton
								id: html lastId;
								onClick: (html jQuery ajax callback: [ self browserStrategy showVariables ]);
								value: self browserStrategy isShowingVariables.
							html mdlRadioLabel: [ html text: 'Inst. var.' ] ] ] ]
]
