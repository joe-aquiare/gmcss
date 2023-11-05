/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/// @desc  Draws a gmcss element to the current surface.
/// @param _element {Id.Instance} The element to render. Self by default.
function __gmcss_element_render(_element = self) {
	
	#region Get properties
	
	// Get position offset for element
	var offset = _element.style.get_property(GMCSS_STYLE_PROPERTIES.OFFSET);

	// Get draw origin for element
	var draw_origin = {
		x: _element.use_application_surface ? (floor(_element.x) + floor(_element.parent_offset.x) + floor(offset.x)) : 0,
		y: _element.use_application_surface ? (floor(_element.y) + floor(_element.parent_offset.y) + floor(offset.y)) : 0,
	};
	
	// Amount to compensate the surface offset for drawn borders
	var border_width = _element.style.get_property(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH);
	
	if(!use_application_surface) {
		
		if(_element.style.get_property(GMCSS_STYLE_PROPERTIES.BORDER_TOP)) {
			draw_origin.y += border_width.top;
		}

		if(_element.style.get_property(GMCSS_STYLE_PROPERTIES.BORDER_LEFT)) {
			draw_origin.x += border_width.left;
		}
		
	}
	
	// Get draw dimensions for element
	var draw_dimensions = {
		width: _element.get_width_in_pixels(),
		height: _element.get_height_in_pixels(),
	};

	// If element has negative size, skip rendering it
	if(draw_dimensions.width <= 0 || draw_dimensions.height <= 0) {
		exit;
	}
	
	#endregion
	
	#region Prepare surface
	
	if(!_element.use_application_surface) {
	
		// If surface does not exist, create one
		if(_element.surface == undefined || !surface_exists(_element.surface)) {
		
			_element.surface = surface_create(
				clamp(floor(draw_dimensions.width + border_width.left + border_width.right + 1), 1, 999999), 
				clamp(floor(draw_dimensions.height + border_width.top + border_width.bottom + 1), 1, 999999)
			);
		
		// Else, ensure surface in use is the correct size
		} else {
			if(
				surface_get_width(_element.surface) != floor(draw_dimensions.width + border_width.left + border_width.right) || 
				surface_get_height(_element.surface) != floor(draw_dimensions.height + border_width.top + border_width.bottom)
			) {
				surface_resize(
					_element.surface, 
					clamp(floor(draw_dimensions.width + border_width.left + border_width.right + 1), 1, 999999), 
					clamp(floor(draw_dimensions.height + border_width.top + border_width.bottom + 1), 1, 999999)
				);
			}
		}
	
		// Set surface target
		surface_set_target(_element.surface);
	
		// Clear surface
		draw_clear_alpha(c_black, 0);
	
	}
	
	#endregion
	
	#region Draw background
	
	var background_type = _element.style.get_property(GMCSS_STYLE_PROPERTIES.BACKGROUND);
	
	switch(background_type) {
		
		case GMCSS_STYLE_BACKGROUNDS.COLOR:
		
			// Set draw properties
			draw_set_alpha(_element.style.get_property(GMCSS_STYLE_PROPERTIES.BG_ALPHA));
			draw_set_color(_element.style.get_property(GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR));
	
			// Draw background rectangle
			draw_rectangle(
				draw_origin.x,
				draw_origin.y,
				draw_origin.x + draw_dimensions.width - 1,
				draw_origin.y + draw_dimensions.height - 1,
				false
			);
		
		break;
		
		case GMCSS_STYLE_BACKGROUNDS.IMAGE:
		
			// Draw background image
			draw_sprite_stretched_ext(
				_element.style.get_property(GMCSS_STYLE_PROPERTIES.BACKGROUND_IMAGE),
				0,
				draw_origin.x,
				draw_origin.y,
				draw_dimensions.width,
				draw_dimensions.height,
				c_white,
				_element.style.get_property(GMCSS_STYLE_PROPERTIES.BG_ALPHA)
			);
		
		break;
		
	}

	#endregion
	
	#region Draw text
	
	// If element has text, draw the text inside the element
	if(string_length(_element.text) > 0) {
		
		// Set draw properties
		draw_set_alpha(_element.style.get_property(GMCSS_STYLE_PROPERTIES.TEXT_ALPHA));
		draw_set_color(_element.style.get_property(GMCSS_STYLE_PROPERTIES.TEXT_COLOR));
		draw_set_font(_element.style.get_property(GMCSS_STYLE_PROPERTIES.FONT_FAMILY));
		
		draw_text_ext(
			draw_origin.x + _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT),
			draw_origin.y + _element.style.get_property(GMCSS_STYLE_PROPERTIES.PADDING_TOP),
			_element.text,
			_element.style.__get_total_line_height(),
			_element.get_width_in_pixels()
		);
		
	}
	
	#endregion
	
	#region Draw border
	
	// Draw border thickness as multiple rectangles if flush
	if(_element.style.__border_is_flush()) {
		
		// Set draw properties
		draw_set_alpha(_element.style.get_property(GMCSS_STYLE_PROPERTIES.BORDER_ALPHA));
		draw_set_color(_element.style.get_property(GMCSS_STYLE_PROPERTIES.BORDER_COLOR));

		for(var border_layer = 0; border_layer < border_width.top; border_layer++) {
			draw_rectangle(
				draw_origin.x - border_layer,
				draw_origin.y - border_layer,
				draw_origin.x + draw_dimensions.width + border_layer,
				draw_origin.y + draw_dimensions.height + border_layer,
				true
			);
		}

	// Border is not flush - draw each side individually
	} else {
		
		draw_set_alpha(_element.style.get_property(GMCSS_STYLE_PROPERTIES.BORDER_ALPHA));
		draw_set_color(_element.style.get_property(GMCSS_STYLE_PROPERTIES.BORDER_COLOR));
		
		// Top
		if(border_width.top > 0) {
			draw_rectangle(
				draw_origin.x - border_width.left,
				draw_origin.y - border_width.top - 1,
				draw_origin.x + draw_dimensions.width + border_width.right,
				draw_origin.y - 1,
				false
			);
		}
		
		// Bottom
		if(border_width.bottom > 0) {
			draw_rectangle(
				draw_origin.x - border_width.left,
				draw_origin.y + draw_dimensions.height + 1,
				draw_origin.x + draw_dimensions.width + border_width.right,
				draw_origin.y + draw_dimensions.height + border_width.bottom,
				false
			);
		}
		
		// Left
		if(border_width.left > 0) {
			draw_rectangle(
				draw_origin.x - border_width.left,
				draw_origin.y - border_width.top,
				draw_origin.x - 1,
				draw_origin.y + draw_dimensions.height + border_width.bottom,
				false
			);
		}
		
		// Right
		if(border_width.right > 0) {
			draw_rectangle(
				draw_origin.x + draw_dimensions.width + 1,
				draw_origin.y - border_width.top,
				draw_origin.x + draw_dimensions.width + border_width.right,
				draw_origin.y  + draw_dimensions.height + border_width.bottom,
				false
			);
		}
		
	}
	
	#endregion
	
	#region Draw surface
	
	if(!_element.use_application_surface) {
	
		surface_reset_target();
		
		var scale = _element.style.get_property(GMCSS_STYLE_PROPERTIES.SCALE);
		var origin = _element.style.get_property(GMCSS_STYLE_PROPERTIES.ORIGIN);
		
		var scale_offset = {
			x: (draw_dimensions.width * origin.x) * (scale.x - 1),
			y: (draw_dimensions.height * origin.y) * (scale.y - 1),
		};
	
		draw_surface_ext(
			_element.surface, 
			_element.x + _element.parent_offset.x + offset.x - border_width.left - scale_offset.x, 
			_element.y + _element.parent_offset.y + offset.y - border_width.top - scale_offset.y,
			scale.x,
			scale.y,
			0,
			c_white,
			_element.style.get_property(GMCSS_STYLE_PROPERTIES.ALPHA)
		);
	
	}
	
	#endregion
	
	#region Cleanup
	
	draw_set_color(c_white);
	draw_set_alpha(1.0);
	
	#endregion
	
}