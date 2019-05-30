//
//  ListView.swift
//  TermKit
//
//  Created by Miguel de Icaza on 5/23/19.
//  Copyright © 2019 Miguel de Icaza. All rights reserved.
//

import Foundation

public protocol ListViewDataSource {
    
}

public protocol ListViewDelegate {
    
}

/**
 * ListView is a control used to displays rows of data
 */
public class ListView : View {
    class EmptyListViewDataSource : ListViewDataSource {
    
    }
    class EmptyListViewDelegate : ListViewDelegate {
        
    }
    public var dataSource : ListViewDataSource {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var delegate : ListViewDelegate {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override init ()
    {
        dataSource = EmptyListViewDataSource()
        delegate = EmptyListViewDelegate()
        super.init ()
    }
}
