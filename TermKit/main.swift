//
//  main.swift
//  MiniGui
//
//  Created by Miguel de Icaza on 3/6/19.
//  Copyright © 2019 Miguel de Icaza. All rights reserved.
//

import Foundation
import Darwin.ncurses

Application.prepare()
print ("starting")
let w = Window()
w.x = Pos.at (0)
w.y = Pos.at (0)
w.width = Dim(20)
w.height = Dim (20)
Application.top.addSubview(w)
Application.run()
print ("ending")
