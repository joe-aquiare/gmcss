/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/// @desc    Returns a gmcss element's height in pixels.
/// @param   _element	{Id.Instance}	The element to measure.
/// @returns			{Real}			The height of the element in pixels.
function __gmcss_element_get_height_in_pixels(_element = self) {
	
	var height = 0;
	
	switch(__gmcss_style_property_value_get_type(_element.style.get_property(GMCSS_STYLE_PROPERTIES.HEIGHT))) {
		
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER: 
		
			// Return numerical height
			height = _element.style.get_property(GMCSS_STYLE_PROPERTIES.HEIGHT);
			
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT: 
		
			// If there is a parent element, get a percent of the parent element's height
			if(_element.parent != undefined) {
				var parent_height = __gmcss_element_get_inner_height_in_pixels(_element.parent);
				height = parent_height * (
					real(
						string_copy(
							_element.style.get_property(GMCSS_STYLE_PROPERTIES.HEIGHT), 
							0, 
							string_length(_element.style.get_property(GMCSS_STYLE_PROPERTIES.HEIGHT)) - 1
						)
					) /100
				);
			}

		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.AUTO:
		
			// Add inner padding
			var cumulative_height = 0;
			
			cumulative_height += _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_TOP);
			cumulative_height += _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM);
			
			// Add height of child elements
			for(var child_index = 0; child_index < ds_list_size(_element.children); child_index++) {
				
				// Add child height and margin
				cumulative_height += _element.children[|child_index].get_height_in_pixels();
				cumulative_height += _element.children[|child_index].style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_TOP);
				cumulative_height += _element.children[|child_index].style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM);
				
				// Account for offset
				cumulative_height += _element.children[|child_index].offset.y;
				
			}

			// Account for text that may be longer than children
			if(string_length(_element.text) > 0) {
				
				// Set font for measurement
				var prev_font = draw_get_font();
				draw_set_font(_element.style.get_property(GMCSS_STYLE_PROPERTIES.FONT_FAMILY));

				var text_height = string_height_ext(
					_element.text,
					_element.style.__get_total_line_height(),
					_element.get_width_in_pixels()
				);
		
				// Reset font
				draw_set_font(prev_font);
				
				cumulative_height += text_height;
				
			}
			
			// Return total height
			height = cumulative_height;
			
		break;
			
	}
	
	return floor(height);
	
}

/// @desc    Returns a gmcss element's inner height in pixels.
/// @param   _element	{Id.Instance}	The element to measure.
/// @returns			{Real}			The inner height of the element in pixels.
function __gmcss_element_get_inner_height_in_pixels(_element = self) {
	
	var height = 0;
	
	switch(__gmcss_style_property_value_get_type(_element.style.get_property(GMCSS_STYLE_PROPERTIES.HEIGHT))) {
		
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER: 
		
			// Return numerical inner height
			height = _element.style.get_property(GMCSS_STYLE_PROPERTIES.HEIGHT) - 
				_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT) - 
				_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT);
				
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT: 
		
			// If there is a parent element, get a percent of the parent element's height
			if(parent != undefined) {
				var parent_height = __gmcss_element_get_height_in_pixels(_element.parent);
				height = parent_height * 
				(
					real(
						string_copy(
							_element.style.get_property(GMCSS_STYLE_PROPERTIES.HEIGHT), 
							0, 
							string_length(_element.style.get_property(GMCSS_STYLE_PROPERTIES.HEIGHT)) - 1
						)
					) / 100
				) - _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT) - _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT);
			}
			
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.AUTO:

			// Add height of child elements
			var cumulative_height = 0;
			
			for(var child_index = 0; child_index < ds_list_size(_element.children); child_index++) {
				
				// Add child height and margin
				cumulative_height += _element.children[|child_index].get_height_in_pixels();
				cumulative_height += _element.children[|child_index].style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_TOP);
				cumulative_height += _element.children[|child_index].style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM);
				
				// Account for offset
				cumulative_height += _element.children[|child_index].offset.y;
				
			}
			
			// Account for text that may be longer than children
			if(string_length(_element.text) > 0) {
				
				// Set font for measurement
				var prev_font = draw_get_font();
				draw_set_font(_element.style.get_property(GMCSS_STYLE_PROPERTIES.FONT_FAMILY));

				var text_height = string_height_ext(
					_element.text,
					_element.style.__get_total_line_height(),
					_element.get_width_in_pixels()
				);
		
				// Reset font
				draw_set_font(prev_font);

				cumulative_height += text_height;
				
			}
			
			// Return total height
			height = cumulative_height;
		
		break;
			
	}
	
	return floor(height);
	
}