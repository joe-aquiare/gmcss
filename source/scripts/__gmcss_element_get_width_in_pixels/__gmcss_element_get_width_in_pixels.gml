/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

function __gmcss_element_get_width_in_pixels(_inner = false, _element = self) {
	
	var width = 0;
	
	switch(__gmcss_style_property_value_get_type(_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH))) {
		
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER: 
		
			// Return numerical width
			width = _element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH) - (_inner ? (	
					_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT) + 
					_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT)
				) : 0)
			
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT: 
		
			// If there is a parent element, get a percent of the parent element's width
			if(_element.parent != undefined) {
				var parent_width = __gmcss_element_get_inner_width_in_pixels(_element.parent);
				width = (parent_width * 
				(
					real(
						string_copy(
							_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH), 
							0, 
							string_length(_element.style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH)) - 1
						)
					) / 100
				)) - (_inner ? (	
					_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT) - 
					_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT)
				) : 0);
			}
			
		break;
			
		case GMCSS_STYLE_PROPERTY_VALUE_TYPES.AUTO:
		
			if(_element.parent != undefined && _element.parent.style.get_property(GMCSS_STYLE_PROPERTIES.DISPLAY) == GMCSS_VALUE_PROPERTY_FLEX) {
				
				var parent_inner_width = _element.parent.get_inner_width_in_pixels();

				var forced_width = 0;
				var auto_children_count = 0;
	
				for(var child_index = 0; child_index < ds_list_size(_element.parent.children); child_index++) {
					
					if(_element.parent.children[| child_index].style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH) != GMCSS_VALUE_PROPERTY_AUTO) {
						
						forced_width += _element.parent.children[| child_index].get_width_in_pixels();
						
					} else {
						auto_children_count++;
					}
					
					forced_width += _element.parent.children[| child_index].style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_LEFT) + 
									_element.parent.children[| child_index].style.get_property(GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT);
					
				}
				
				var leftover_width = parent_inner_width - forced_width;
				
				width = leftover_width / auto_children_count;

				
			} else {
		
				// Get longest child element
				var longest_child_width = 0;
			
				for(var child_index = 0; child_index < ds_list_size(_element.children); child_index++) {
				
					// Get initial width of child
					var child_width = _element.children[|child_index].style.get_property(GMCSS_STYLE_PROPERTIES.WIDTH);
				
					if(__gmcss_style_property_value_get_type(child_width) == GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER) {

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
				width = longest_child_width + (!_inner ? (	
					_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT) + 
					_element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT)
				) : 0);
			
			}
		
		break;
			
	}
	
	return width;
	
}

function __gmcss_element_get_inner_width_in_pixels(_element = self) {
	return 	__gmcss_element_get_width_in_pixels(true, _element);
}