
import SwiftUI

class ViewFrame: ObservableObject {
	var startingRect: CGRect?
	
	@Published var frame: CGRect {
		willSet {
			if startingRect == nil {
				startingRect = newValue
			}
		}
	}
	
	init() {
		self.frame = .zero
	}
}
