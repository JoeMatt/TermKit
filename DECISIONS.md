This document contains some design decisions about TermKit, they are
not set in stone, but should help explain why things are the way they
are.

# Rendering

In the C# version, views rendered via calling a method directly in the
driver (which had clipping support), or via a conveniece methods in the
View.

I decided to change this to have a "Painter" which tracks the location
and attribute within a view - and is created at the start of a redraw
operation, and released at the end.   This will be the foundation for
clipping, but also ensures that the location of the cursor does not
need to be part of the view for example.

# Events on the View

Generally the model for Views should be to subclass and override one
of the key methods like the key event, mouse events and redrawing.   That
said, in gui.cs, the model was extended to raise events and allow
external code to easily customize the views, without subclassing.

I am not sure how I feel about this, for a few reasons.  For one, it
means that every view contains a bunch of events that might never
be used, and this takes memory.

But memory is cheap, so a handful of bytes for a console UI is likely
not a problem.   I am still on the fence on this, and this is why it is
not yet fully realized for all possible events.

There are two existing designs that can help reduce memory usage, one is the
Apple-like "delegate" pattern, where a delegate is provided to respond
to assorted messages.   The other is the WPF-like DependencyObject
system where a hashtable with default is kept, and values are created
on demand.   If this becomes an issue, those two approaches could be
explored.

# Visibility on View

In gui.cs a recent changed introduced `Visible` as a property, that could
toggle on/off the view.   I believe that this is of limited use, and
that instead removing/adding controls might be better.

The one scenario where this breaks is if the view is used for computing the
layout of other views, yet, it is not desirable to have it on the screen.

Will try not having it for now.

# TabIndex and TabIndexes

In gui.cs there is a system that tracks not only the subviews, but
also the tab order, which is the order in which the views were added,
independently of any changes in the paint order (bringToFront,
sendToBack, bringForward, etc).

For now, I am avoiding that, and just using subviews.  Might
considering adding it later, but for now, given that I am
bootstrapping this, I decided to not bring it.

# ISupportInitialize

This is a convention that is used to handle initialization of controls
in stages, popular in the Winforms world.  For now, I decied not to
bring this code.  Can revisit later.