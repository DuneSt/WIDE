Class {
	#name : #WIDEBrowserModelFunctionalTest,
	#superclass : #TestCase,
	#instVars : [
		'browserModel'
	],
	#category : #'WIDE-Model-Tests'
}

{ #category : #running }
WIDEBrowserModelFunctionalTest >> setUp [
	browserModel := WIDEBrowserModel new
]

{ #category : #running }
WIDEBrowserModelFunctionalTest >> testClassStepExistWhenPackageIsSelected [
	| packageStep |
	packageStep := browserModel path packageStep.
	packageStep selectedElement: packageStep allElements anyOne. 
	self assert: browserModel path packageStep nextStep notNil
]

{ #category : #running }
WIDEBrowserModelFunctionalTest >> testClassStepIsNil [
	self assert: browserModel path packageStep nextStep isNil
]

{ #category : #running }
WIDEBrowserModelFunctionalTest >> testFirstStepExist [
	self assert: browserModel path packageStep notNil
]

{ #category : #running }
WIDEBrowserModelFunctionalTest >> testModelHasPath [
	self assert: browserModel path notNil
]

{ #category : #running }
WIDEBrowserModelFunctionalTest >> testPackageStepHasElements [
	self assert: browserModel path packageStep allElements notEmpty.
]

{ #category : #running }
WIDEBrowserModelFunctionalTest >> testProtocolStepExistByDefaultWhenPackageAndClassAreSelected [
	| packageStep classStep |
	packageStep := browserModel path packageStep.
	packageStep selectedElement: packageStep allElements anyOne.
	classStep := packageStep nextStep.
	classStep selectedElement: classStep allElements anyOne.
	self assert: classStep nextStep notNil.
	self assert: classStep nextStep class equals: WIDEProtocolStep
]

{ #category : #running }
WIDEBrowserModelFunctionalTest >> testVariableStepExistWhenPackageAndClassAreSelectedAndStrategyShowVariables [
	| packageStep classStep |
	browserModel strategy showVariables.
	packageStep := browserModel path packageStep.
	packageStep selectedElement: packageStep allElements anyOne.
	classStep := packageStep nextStep.
	classStep selectedElement: classStep allElements anyOne.
	self assert: classStep nextStep notNil.
	self assert: classStep nextStep class equals: WIDEVariableStep
]
