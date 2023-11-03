/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/// @desc    Returns a gmcss element's width in pixels.
/// @param   _element	{Id.Instance}	The element to measure.
/// @returns			{Real}			The width of the element in pixels.
function __gmcss_element_get_width_in_pixels(_element = self) {
	
	var width = 0;
	
	switch(__gmcss_style_property_value_get_type(_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH))) {
		
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER: 
		
			// Return numerical width
			width = _element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH);
			
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT: 
		
			// If there is a parent element, get a percent of the parent element's width
			if(_element.parent != undefined) {
				var parent_width = __gmcss_element_get_inner_width_in_pixels(_element.parent);
				width = parent_width * 
				(
					real(
						string_copy(
							_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH), 
							0, 
							string_length(_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH)) - 1
						)
					) / 100
				);
			}
			
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.AUTO:
		
			// Add inner padding
			var cumulative_width = 0;
			
			cumulative_width += _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT);
			cumulative_width += _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT);
			
			// Get longest child element
			var longest_child_width = 0;
			
			for(var child_index = 0; child_index < ds_list_size(_element.children); child_index++) {
				
				// Get initial width of child
				var child_width = _element.children[|child_index].style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH);
				
				if(__gmcss_style_property_value_get_type(child_width) == GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER) {
				
					// Consider child offset
					child_width += _element.children[|child_index].offset.x;
				
					// Add child width and margin
					if(__gmcss_style_property_value_get_type(child_width) == GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER) {
						if(child_width > longest_child_width) {
							longest_child_width = child_width;
						}
					}
				
				}
				
			}
			
			// Account for text that may be longer than children
			if(string_length(_element.text) > 0) {
				
				// Set font for measurement
				var prev_font = draw_get_font();
				draw_set_font(_element.style.get_property(GMCSS_STYLE_PROPERTIES.FONT_FAMILY));

				var text_width = string_width(_element.text);
		
				// Reset font
				draw_set_font(prev_font);
				
				if(text_width > longest_child_width) {
					longest_child_width = text_width;	
				}
				
			}
			
			// Return total width
			width = cumulative_width + longest_child_width;
			
		break;
			
	}
	
	return floor(width);
	
}

/// @desc    Returns a gmcss element's inner width in pixels.
/// @param   _element	{Id.Instance}	The element to measure.
/// @returns			{Real}			The inner width of the element in pixels.
function __gmcss_element_get_inner_width_in_pixels(_element = self) {
	
	var width = 0;
	
	switch(__gmcss_style_property_value_get_type(_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH))) {
		
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER: 
		
			// Return numerical inner width
			width = _element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH) - 
				_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT) - 
				_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT);
				
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT: 
		
			// If there is a parent element, get a percent of the parent element's width
			if(parent != undefined) {
				var parent_width = __gmcss_element_get_width_in_pixels(_element.parent);
				width = parent_width * 
				(
					real(
						string_copy(
							_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH), 
							0, 
							string_length(_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH)) - 1
						)
					) / 100
				) - element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT) - _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT);
			}
			
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.AUTO:
		
			// Get longest child element
			var longest_child_width = 0;
			
			for(var child_index = 0; child_index < ds_list_size(_element.children); child_index++) {
				
				// Get initial width of child
				var child_width = _element.children[|child_index].style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH);
				
				if(__gmcss_style_property_value_get_type(child_width) == GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER) {
				
					// Consider child offset
					child_width += _element.children[|child_index].offset.x;
				
					// Add child width and margin
					if(__gmcss_style_property_value_get_type(child_width) == GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER) {
						if(child_width > longest_child_width) {
							longest_child_width = child_width;
						}
					}
				
				}
				
			}
			
			// Account for text that may be longer than children
			if(string_length(_element.text) > 0) {
				
				// Set font for measurement
				var prev_font = draw_get_font();
				draw_set_font(_element.style.get_property(GMCSS_STYLE_PROPERTIES.FONT_FAMILY));

				var text_width = string_width(_element.text);
		
				// Reset font
				draw_set_font(prev_font);
				
				if(text_width > longest_child_width) {
					longest_child_width = text_width;	
				}
				
			}
			
			// Return total width
			width = longest_child_width;
			
		break;
			
	}
	
	return floor(width);
	
}