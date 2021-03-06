//
//  fondoGradienteSinRuntime.swift
//  Kimi Trivia
//
//  Created by Leonardo Gutiérrez on 4/19/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit

class fondoGradienteSinRuntime: UIView {

    var startColor : UIColor = UIColor.blueColor()
    var endColor : UIColor = UIColor.cyanColor()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let contexto = UIGraphicsGetCurrentContext()
        let colores = [startColor.CGColor, endColor.CGColor]
        // establecer el espacio de color
        let espacioDeColor = CGColorSpaceCreateDeviceRGB()
        // establece los lugares en los que cambia el color
        let localizacionColores :[CGFloat] = [0.0, 1.0]
        // crea el gradiente
        let gradiente = CGGradientCreateWithColors(espacioDeColor, colores, localizacionColores)
        //dibuja el gradiente
        let puntoInicio = CGPoint.zero
        let puntoFin = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(contexto, gradiente, puntoInicio, puntoFin, CGGradientDrawingOptions.DrawsAfterEndLocation)
        
    }

}
