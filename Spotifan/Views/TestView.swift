//
//  TestView.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 06/11/22.
//

import SwiftUI
import Request
import Json

class TestViewModel : ObservableObject {
	//	
}

struct TestView: View {
	@StateObject public var vm : TestViewModel;
	@State var height : CGFloat = .zero;
	
	var body: some View {
		EmptyView()
	}
}

struct TestView_Previews: PreviewProvider {
	static var previews: some View {
		TestView(vm: .init())
	}
}
