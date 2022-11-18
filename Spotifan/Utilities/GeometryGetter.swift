//
//  GeometryGetter.swift
//  Spotifan
//
//  Created by Muhammad Arfan on 09/11/22.
//

import SwiftUI

struct GeometryGetter: View {
    
    typealias Handler = (_ rect : CGRect) -> Void ;
    
    let frameIn : CoordinateSpace
    @Binding var rect: CGRect?
    @Binding var size: CGSize?
    var handler : Handler? ;
    
    init(
        frameIn : CoordinateSpace = .global,
        rect: Binding<CGRect?> = .constant(nil),
        size: Binding<CGSize?> = .constant(nil),
        handler : Handler? = nil
    ) {
        self._rect = rect
        self._size = size
        self.frameIn = frameIn
        self.handler = handler
    }
    
    var body: some View {
        GeometryReader { geometry in
            let rect = geometry.frame(in: self.frameIn)
            
            // these statements are used to make more efficient app
            if let handler = self.handler {
                Color.clear.task(id: rect) {
                    DispatchQueue.main.async {
                        handler(rect)
                    }
                }
            } else {
                Color.clear.task(id: rect) {
                    if self.rect != nil {
                        DispatchQueue.main.async {
                            self.rect = rect
                        }
                    }
                    if self.size != nil {
                        DispatchQueue.main.async {
                            self.size = rect.size
                        }
                    }
                }
            } // end of ifelse

        }
    }
}

