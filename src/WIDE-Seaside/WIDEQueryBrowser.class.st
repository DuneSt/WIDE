Class {
	#name : #WIDEQueryBrowser,
	#superclass : #MDLHighLevelWidget,
	#category : #'WIDE-Seaside-Widgets'
}

{ #category : #rendering }
WIDEQueryBrowser >> renderContentOn: html [
	html div
		with:
			(MDLSortableTable new
				header: self tableHeader;
				rows: [ self rows ];
				selectable: true;
				rowsPerPagePossibilities: #(10 50 100 200);
				yourself)
]

{ #category : #accessing }
WIDEQueryBrowser >> rows [
	^ self subclassResponsibility
]

{ #category : #accessing }
WIDEQueryBrowser >> tableHeader [
	^ self subclassResponsibility
]
