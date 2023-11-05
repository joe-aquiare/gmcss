/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/// @desc Initializes a gmcss element.

#region Object variables

style = new __gmcss_style();	// Style struct containing all style properties of this element

children			= ds_list_create();							// This element's children
child_index			= 0;										// The index of this child in the parent's child list
parent				= undefined;								// This element's parent
draw_event			= GMCSS_DEFAULT_ELEMENT_DRAW_EVENT;			// The draw event for this element
parent_offset		= { x: 0, y: 0 };							// The position offset from this element's parent
text				= "";										// Text for this element to render
surface				= undefined;								// The surface for drawing this element
hover_state			= GMCSS_ELEMENT_HOVER_STATES.NOT_HOVERED	// The current hover state of the element

#endregion
 
#region Rules

assert_child_depth = GMCSS_DEFAULT_ELEMENT_ASSERT_CHILD_DEPTH;	// Whether depth on child elements is a forced property
use_application_surface = false;								// Whether to ignore the element surface and draw directly onto the application surface

#endregion

#region Event lists

mouse_events = {
	enter:			ds_list_create(),	// Events that fire when the mouse enters the element
	leave:			ds_list_create(),	// Events that fire when the mouse leaves the element
	click:			ds_list_create(),	// Events that fire when the mouse left-clicks the element
	right_click:	ds_list_create(),	// Events that fire when the mouse right-clicks the element
};

#endregion

#region Shortcuts

add_child					= __gmcss_element_add_child;					// Adds a child to the element
add_event					= __gmcss_element_add_event;					// Adds an event to the event lists
get_width_in_pixels			= __gmcss_element_get_width_in_pixels;			// Gets the width of the element in pixels
get_inner_width_in_pixels	= __gmcss_element_get_inner_width_in_pixels;	// Gets the inner width of the element in pixels
get_height_in_pixels		= __gmcss_element_get_height_in_pixels;			// Gets the height of the element in pixels
get_inner_height_in_pixels	= __gmcss_element_get_inner_height_in_pixels;	// Gets the inner height of the element in pixels

// TODO: Add shortcut for events

#endregion