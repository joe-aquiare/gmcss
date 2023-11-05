#region Assert child depth

if(assert_child_depth) {
	for(var child_index = 0; child_index < ds_list_size(children); child_index++) {
		children[| child_index].depth = depth - 1;
	}	
}

#endregion

#region Child origins

// Initial offset from parent
var cumulative_offset = {
	x: 0,
	y: 0
};

// Go through children and assign offsets based on style properties of parent
for(var child_index = 0; child_index < ds_list_size(children); child_index++) {
	
	children[| child_index].parent_offset.x = 
		x + 
		style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_LEFT) + 
		style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT) + 
		cumulative_offset.x;
	
	children[| child_index].parent_offset.y = 
		y + 
		style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_TOP) + 
		style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_TOP) + 
		cumulative_offset.y;
		
	// Increment y for text content
	if(string_length(text) > 0) {
		
		// Set font for measurement
		var prev_font = draw_get_font();
		draw_set_font(style.get_property(GMCSS_STYLE_PROPERTIES.FONT_FAMILY));

		children[| child_index].parent_offset.y += string_height_ext(
			text, 
			style.__get_total_line_height(),
			get_width_in_pixels()
		);
		
		// Reset font
		draw_set_font(prev_font);
		
	}

	// Increment y for normal layout
	cumulative_offset.y += 
		children[| child_index].get_height_in_pixels() + 
		children[| child_index].style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM);
		
	// TODO: Account for flex layout
	
}

#endregion

#region Hover state

// Get cursor position
var cursor_position = {
	x: mouse_x,
	y: mouse_y,
};

// Get bounds of element
var element_bounds = gmcss_element_get_bounds();

// Check if cursor is in bounds
var cursor_in_bounds = point_in_rectangle(
	cursor_position.x,
	cursor_position.y,
	element_bounds.x1,
	element_bounds.y1,
	element_bounds.x2,
	element_bounds.y2
);

// Set cursor if in bounds
if(cursor_in_bounds) {
	
	var cursor = style.get_property(GMCSS_STYLE_PROPERTIES.CURSOR);

	if(cursor != cr_default) {
		previous_cursor = window_get_cursor();
		window_set_cursor(cursor);
	}
	
}

// Track previous hover state, get new state
var hover_state_prev = hover_state;
hover_state = cursor_in_bounds ? GMCSS_ELEMENT_HOVER_STATES.HOVERED : GMCSS_ELEMENT_HOVER_STATES.NOT_HOVERED;

// Newly hovered - fire mouse enter events
if(hover_state == GMCSS_ELEMENT_HOVER_STATES.HOVERED && hover_state_prev == GMCSS_ELEMENT_HOVER_STATES.NOT_HOVERED) {
	
	for(var event_index = 0; event_index < ds_list_size(mouse_events.enter); event_index++) {
		
		if(typeof(mouse_events.enter[|event_index]) == "method") {
			mouse_events.enter[|event_index]();
		} else {
			__gmcss_error(__GMCSS_ERROR_PREFIX_GENERAL + "Triggered function in mouse_events.enter was not a function!");
		}
		
	}
	
}

// Newly unhovered - fire mouse leave events
if(hover_state == GMCSS_ELEMENT_HOVER_STATES.NOT_HOVERED && hover_state_prev == GMCSS_ELEMENT_HOVER_STATES.HOVERED) {

	for(var event_index = 0; event_index < ds_list_size(mouse_events.leave); event_index++) {
		
		if(typeof(mouse_events.leave[|event_index]) == "method") {
			mouse_events.leave[|event_index]();
		} else {
			__gmcss_error(__GMCSS_ERROR_PREFIX_GENERAL + $"Triggered function in mouse_events.leave was not a function!");
		}
		
	}
	
	// Unset cursor property
	var cursor = style.get_property(GMCSS_STYLE_PROPERTIES.CURSOR);

	if(cursor != cr_default) {
		window_set_cursor(cr_default);
	}
	
}

if(hover_state == GMCSS_ELEMENT_HOVER_STATES.HOVERED) {
	
	// Click events
	if(mouse_check_button_pressed(mb_left)) {
		
		for(var event_index = 0; event_index < ds_list_size(mouse_events.click); event_index++) {
		
			if(typeof(mouse_events.click[|event_index]) == "method") {
				mouse_events.click[|event_index]();
			} else {
				__gmcss_error(__GMCSS_ERROR_PREFIX_GENERAL + $"Triggered function in mouse_events.click was not a function!");
			}
		
		}
		
	}
	
	// Right-click events
	if(mouse_check_button_pressed(mb_right)) {
		
		for(var event_index = 0; event_index < ds_list_size(mouse_events.right_click); event_index++) {
		
			if(typeof(mouse_events.right_click[|event_index]) == "method") {
				mouse_events.right_click[|event_index]();
			} else {
				__gmcss_error(__GMCSS_ERROR_PREFIX_GENERAL + $"Triggered function in mouse_events.right_click was not a function!");
			}
		
		}
		
	}
	
}

#endregion