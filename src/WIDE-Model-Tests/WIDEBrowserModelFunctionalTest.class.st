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

{ #category : #tests }
WIDEBrowserModelFunctionalTest >> testClassStepExistWhenPackageIsSelected [
	| packageStep |
	packageStep := browserModel path packageStep.
	packageStep selectedElement: packageStep allElements anyOne. 
	self assert: browserModel path packageStep nextStep notNil
]

{ #category : #tests }
WIDEBrowserModelFunctionalTest >> testClassStepIsNil [
	self assert: browserModel path packageStep nextStep isNil
]

{ #category : #tests }
WIDEBrowserModelFunctionalTest >> testFirstStepExist [
	self assert: browserModel path packageStep notNil
]

{ #category : #tests }
WIDEBrowserModelFunctionalTest >> testModelHasPath [
	self assert: browserModel path notNil
]

{ #category : #tests }
WIDEBrowserModelFunctionalTest >> testPackageStepHasElements [
	self assert: browserModel path packageStep allElements notEmpty.
]

{ #category : #tests }
WIDEBrowserModelFunctionalTest >> testProtocolStepExistByDefaultWhenPackageAndClassAreSelected [
	| packageStep classStep |
	packageStep := browserModel path packageStep.
	packageStep selectedElement: packageStep allElements anyOne.
	classStep := packageStep nextStep.
	classStep selectedElement: classStep allElements anyOne.
	self assert: classStep nextStep notNil.
	self assert: classStep nextStep class equals: WIDEProtocolStep
]

{ #category : #tests }
WIDEBrowserModelFunctionalTest >> testProtocolStepIsNilAfterChangeSelectedPackage [
	| packageStep classStep |
	packageStep := browserModel path packageStep.
	packageStep selectedElement: packageStep allElements anyOne.
	classStep := packageStep nextStep.
	classStep selectedElement: classStep allElements anyOne.
	self assert: classStep nextStep notNil.
	self assert: classStep nextStep class equals: WIDEProtocolStep.
	packageStep selectedElement: packageStep allElements anyOne.
	classStep := packageStep nextStep.
	self assert: classStep nextStep isNil
]

{ #category : #tests }
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
