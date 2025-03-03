//
//  Events.swift - Core definitions for events
//  TermKit
//
//  Created by Miguel de Icaza on 4/9/19.
//  Copyright © 2019 Miguel de Icaza. All rights reserved.
//

import Foundation

/**
 * The Key enumeration contains special encoding for some keys, but can also
 * encode all the unicode values that can be passed.
 *
 * If the SpecialMask is set, then the value is that of the special mask,
 * otherwise, the value is the one of the lower bits (as extracted by CharMask)
 *
 *  Control keys are the values between 1 and 26 corresponding to Control-A to Control-Z
 *
 * UnicodeScalars are also stored here, the letter 'A" for example is encoded as a value 65 (not surfaced in the enum).
 */
public enum Key {
    /// The key code for the user pressing Control-spacebar
    case controlSpace
    /// The key code for the user pressing Control-A
    case controlA
    /// The key code for the user pressing Control-B
    case controlB
    /// The key code for the user pressing Control-C
    case controlC
    /// The key code for the user pressing Control-D
    case controlD
    /// The key code for the user pressing Control-E
    case controlE
    /// The key code for the user pressing Control-F
    case controlF
    /// The key code for the user pressing Control-G
    case controlG
    /// The key code for the user pressing Control-H
    case controlH
    static var backspace : Key {
        get {
            return controlH
        }
    }

    /// The key code for the user pressing Control-I
    case controlI
    /// The key code for the user pressing Control-J
    case controlJ
    
    static var returnKey : Key {
        get {
            return controlJ
        }
    }
    /// The key code for the user pressing Control-K
    case controlK
    /// The key code for the user pressing Control-L
    case controlL
    /// The key code for the user pressing Control-M
    case controlM
    /// The key code for the user pressing Control-N
    case controlN
    /// The key code for the user pressing Control-O
    case controlO
    /// The key code for the user pressing Control-P
    case controlP
    /// The key code for the user pressing Control-Q
    case controlQ
    /// The key code for the user pressing Control-R
    case controlR
    /// The key code for the user pressing Control-S
    case controlS
    /// The key code for the user pressing Control-T
    case controlT
    /// The key code for the user pressing Control-U
    case controlU
    /// The key code for the user pressing Control-V
    case controlV
    /// The key code for the user pressing Control-W
    case controlW
    /// The key code for the user pressing Control-X
    case controlX
    /// The key code for the user pressing Control-Y
    case controlY
    /// The key code for the user pressing Control-Z
    case controlZ
    
    /// The  key code for the user pressing the ESC key
    case esc
    
    // Value 28
    /// ASCII sequence for Field Separator (^\)
    case fs
    
    // Value 29
    /// ASCII sequence for Group Separator (^])
    case gs
    
    // Value 30
    /// ASCII sequence for Record Separator (^^)
    case rs
    
    // Value 31
    /// ASCII sequence for Unit Separator (^_)
    case us
    
    /// The keycode for the user pressing the delete key
    case delete
    
    /// Cursor up key pressed
    case cursorUp
    /// Cursor down key pressed
    case cursorDown
    /// Cursor left key pressed
    case cursorLeft
    /// Cursor right key pressed
    case cursorRight
    /// Page up key pressed
    case pageUp
    /// Page down key pressed
    case pageDown
    /// Home key pressed
    case home
    /// End key pressed
    case end
    /// Delete character key
    case deleteChar
    /// Insert character key
    case insertChar
    /// The F1 Key
    case f1
    /// The F2 Key
    case f2
    /// The F3 Key
    case f3
    /// The F4 Key
    case f4
    /// The F5 Key
    case f5
    /// The F6 Key
    case f6
    /// The F7 Key
    case f7
    /// The F8 Key
    case f8
    /// The F9 Key
    case f9
    /// The F10 Key
    case f10
    /// The shift-tab key
    case backtab
    
    case letter (Character)
    case Unknown
}

/**
 * Describes a key event, this includes the key value, and there are two convenience properties isAlt and isControl
 */
public struct KeyEvent {
    /// Symbolic definition of the key
    public var key : Key
    var _isControl, _isAlt : Bool
    
    /// Gets a value indicating whether the Alt key was pressed (real or synthesized)
    public var isAlt : Bool {
        get {
            return  _isAlt
        }
    }
    
    /// Determines whether the value is a control key (a shortcut to avoid testing all the Control values)
    public var isControl : Bool {
        get {
            return _isControl
        }
    }
    
    /// Initializes the KeyEvent structure
    init (key: Key, isAlt: Bool = false, isControl: Bool = false)
    {
        self.key = key
        self._isAlt = isAlt
        self._isControl = isControl
    }
}

/**
 * Flags for a mouse event
 */
public struct MouseFlags: OptionSet {
    public let rawValue: UInt
    
    public init (rawValue: UInt)
    {
        self.rawValue = rawValue
    }
    
    static let button1Pressed        = MouseFlags(rawValue: 0x2)
    static let button1Released       = MouseFlags(rawValue: 0x1)
    static let button1Clicked        = MouseFlags(rawValue: 0x4)
    static let button1DoubleClicked  = MouseFlags(rawValue: 0x8)
    static let button1TripleClicked  = MouseFlags(rawValue: 0x10)
    static let button2Pressed        = MouseFlags(rawValue: 0x80)
    static let button2Released       = MouseFlags(rawValue: 0x40)
    static let button2Clicked        = MouseFlags(rawValue: 0x100)
    static let button2DoubleClicked  = MouseFlags(rawValue: 0x200)
    static let button2TrippleClicked = MouseFlags(rawValue: 0x400)
    static let button3Pressed        = MouseFlags(rawValue: 0x2000)
    static let button3Released       = MouseFlags(rawValue: 0x1000)
    static let button3Clicked        = MouseFlags(rawValue: 0x4000)
    static let button3DoubleClicked  = MouseFlags(rawValue: 0x8000)
    static let button3TripleClicked  = MouseFlags(rawValue: 0x10000)
    static let button4Pressed        = MouseFlags(rawValue: 0x80000)
    static let button4Released       = MouseFlags(rawValue: 0x40000)
    static let button4Clicked        = MouseFlags(rawValue: 0x100000)
    static let button4DoubleClicked  = MouseFlags(rawValue: 0x200000)
    static let button4TripleClicked = MouseFlags(rawValue:  0x400000)
    
    /// The shift key was pressed when the mouse event was produced
    static let buttonShift = MouseFlags(rawValue: 0x2000000)
    /// The control key was pressed when the mouse event was produced
    static let buttonCtrl  = MouseFlags(rawValue: 0x1000000)
    /// The alt key was pressed when the mouse event was produced
    static let buttonAlt   = MouseFlags(rawValue: 0x4000000)
    
    static let mousePosition = MouseFlags (rawValue: 0x8000000)
}

/**
 * Describes a mouse event
 */
public struct MouseEvent {
    /// The X (column) location for the mouse event
    public var x: Int
    /// The Y (row) location for the mouse event
    public var y: Int
    
    /// The offset X (column) location for the mouse event relative to the screen.
    public var ofX: Int
    /// The offset Y (column) location for the mouse event relative to the screen.
    public var ofY: Int
    
    /// The event flags
    public var flags: MouseFlags
    
    /// If set, the current view at the location of the mouse event
    public var view: View?

    init (x: Int, y: Int, flags: MouseFlags, view: View? = nil)
    {
        self.x = x
        self.y = y
        self.ofX = 0
        self.ofY = 0
        self.flags = flags
        self.view = view
    }
    
    init (x: Int, y:Int, ofX: Int, ofY: Int, flags: MouseFlags, view: View? = nil)
    {
        self.x = x
        self.y = y
        self.ofX = ofX
        self.ofY = ofY
        self.flags = flags
        self.view = view
    }
}
