//
//  CollectionViewModel.swift
//  CustomListViewExample
//
//  Created by Emre Ağbal on 22.06.2020.
//  Copyright © 2020 Emre Ağbal. All rights reserved.
//

import UIKit

class CollectionViewModel {
    
    internal struct randomView {
        var name   : String
        var color  : UIColor
        let height : CGFloat
    }
    
    var views = [randomView]()
    
    init() {
        createViews()
    }
    
    func createViews() {
        
        
        let purple = randomView(name: "Mor", color: .purple, height: 99)
        let red = randomView(name: "Kırmızı", color: .red, height: 83)
        let orange = randomView(name: "Turuncu", color: .systemOrange, height: 127)
        let colors = [purple, red, orange]
        
        let number = Int.random(in: 34 ... 55)
        
        for _ in 0 ... number {
            views.append(colors.randomElement()!)
        }
}
}
