Class {
	#name : #BaselineOfWIDE,
	#superclass : #BaselineOf,
	#category : #BaselineOfWIDE
}

{ #category : #baselines }
BaselineOfWIDE >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self
				materialDesignLite: spec;
				monacoCodeEditor: spec.
			
			"Packages"
			spec
				package: 'WIDE-Model';
				package: 'WIDE-Model-Tests' with: [ spec requires: #('WIDE-Model') ];
				package: 'WIDE-Seaside' with: [ spec requires: #('WIDE-Model' 'MaterialDesignLite' 'MonacoCodeEditor') ] ].
]

{ #category : #dependencies }
BaselineOfWIDE >> materialDesignLite: spec [
	spec
    	baseline: 'MaterialDesignLite'
    	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfWIDE >> monacoCodeEditor: spec [
	spec
    	baseline: 'MonacoCodeEditor'
    	with: [ spec repository: 'github://DuneSt/MonacoCodeEditor/src' ]
]
