//
//  UIButtonEXtencion.swift
//  iOS-Calculator
//
//  Created by Jose Muñoz on 02-02-23.
//

import UIKit

extension UIButton {
    
    //bordes redondos
    
    func round( ) {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    // Brillo al pulsar botones
    
    func shine( ) {
        UIView.animate(withDuration: 0.1,  animations: {
            self.alpha = 0.5
        }) { ( completion ) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
            
        }
    }

}
