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
					self renderMethodsVariablesToogleOn: html ].
			html mdlCell
				size: 5;
				with: [ 
					html mdlButton
						raised;
						disabled: (self browserState selectedClass class = WIDENullClass);
						with: 'Class refs.'.
					html mdlButton
						raised;
						disabled: (self browserState selectedMethod class = WIDENullMethod);
						with: 'Implementors'.
					html mdlButton
						raised;
						disabled: (self browserState selectedMethod class = WIDENullMethod);
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
						disabled: (self browserState selectedClass class = WIDENullClass);
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
WIDEToolbarComponent >> renderMethodsVariablesToogleOn: html [
	html div
		style: 'display: inline-block; width: 200px;'; flag: #TODO; "Move to stylesheet."
		with: [ 
			html radioGroup
				selected: true;
				with: [ :group | 
					html mdlRadioContainer
						for: html nextId;
						rippleEffect;
						with: [ group mdlRadioButton
								id: html lastId;
								value: true; flag: #TODO. "Use browser state instead"
							html mdlRadioLabel: [ html text: 'Methods' ] ].
					html mdlRadioContainer
						for: html nextId;
						rippleEffect;
						with: [ group mdlRadioButton
								id: html lastId;
								value: false; flag: #TODO. "Use browser state instead"
							html mdlRadioLabel: [ html text: 'Inst. var.' ] ] ] ]
]