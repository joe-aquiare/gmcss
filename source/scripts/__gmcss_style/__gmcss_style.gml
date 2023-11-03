/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/// @desc A gmcss style struct, containing properties for rendering gmcss elements.
function __gmcss_style() constructor {
	
	#region Properties
	
	properties = [
		/* padding				*/	undefined,
		/* padding_top			*/	GMCSS_DEFAULT_STYLE_PADDING.top,
		/* padding_bottom		*/	GMCSS_DEFAULT_STYLE_PADDING.bottom,
		/* padding_left			*/	GMCSS_DEFAULT_STYLE_PADDING.left,
		/* padding_right		*/	GMCSS_DEFAULT_STYLE_PADDING.right,
		/* margin				*/	undefined,
		/* margin_top			*/	GMCSS_DEFAULT_STYLE_MARGIN.top,
		/* margin_bottom		*/	GMCSS_DEFAULT_STYLE_MARGIN.bottom,
		/* margin_left			*/	GMCSS_DEFAULT_STYLE_MARGIN.left,
		/* margin_right			*/	GMCSS_DEFAULT_STYLE_MARGIN.right,
		/* size					*/	undefined,
		/* width				*/	GMCSS_DEFAULT_STYLE_WIDTH,
		/* height				*/	GMCSS_DEFAULT_STYLE_HEIGHT,
		/* bg_color				*/	GMCSS_DEFAULT_STYLE_BACKGROUND_COLOR,
		/* text_color			*/	GMCSS_DEFAULT_STYLE_TEXT_COLOR,
		/* alpha				*/	GMCSS_DEFAULT_STYLE_ALPHA,
		/* bg_alpha				*/	GMCSS_DEFAULT_STYLE_BACKGROUND_ALPHA,
		/* text_alpha			*/	GMCSS_DEFAULT_STYLE_TEXT_ALPHA,
		/* font_family			*/	GMCSS_DEFAULT_STYLE_FONT_FAMILY,
		/* line_height			*/	GMCSS_DEFAULT_STYLE_LINE_HEIGHT,
		/* border				*/	undefined,
		/* border_top			*/	GMCSS_DEFAULT_STYLE_BORDER,
		/* border_bottom		*/	GMCSS_DEFAULT_STYLE_BORDER,
		/* border_left			*/	GMCSS_DEFAULT_STYLE_BORDER,
		/* border_right			*/	GMCSS_DEFAULT_STYLE_BORDER,
		/* border_width			*/	undefined,
		/* border_width_top		*/	GMCSS_DEFAULT_STYLE_BORDER_WIDTH,
		/* border_width_bottom	*/	GMCSS_DEFAULT_STYLE_BORDER_WIDTH,
		/* border_width_left	*/	GMCSS_DEFAULT_STYLE_BORDER_WIDTH,
		/* border_width_right	*/	GMCSS_DEFAULT_STYLE_BORDER_WIDTH,
		/* border_color			*/	GMCSS_DEFAULT_STYLE_BORDER_COLOR,
		/* border_alpha			*/	GMCSS_DEFAULT_STYLE_BORDER_ALPHA,
		/* scale				*/	undefined,
		/* scale_x				*/	GMCSS_DEFAULT_STYLE_SCALE,
		/* scale_y				*/	GMCSS_DEFAULT_STYLE_SCALE,
		/* origin				*/	undefined,
		/* origin_x				*/	GMCSS_DEFAULT_STYLE_ORIGIN,
		/* origin_y				*/	GMCSS_DEFAULT_STYLE_ORIGIN,
		/* cursor 				*/	GMCSS_DEFAULT_STYLE_CURSOR,
		
		// TODO: add: 
		// - align (left, center, right)
		// - flex (true, false)
		// - text_wrap (true, false)
		// - scale percent %
		// - apply_style function, takes a struct and maps
		
	];
	
	#endregion
	
	#region Functions
	
	static set_property = function(_property, _value) {
		
		// Validate incoming value
		__gmcss_style_property_value_validate(_value);
		
		// Get allowed types for property
		var allowed_types = __gmcss_style_property_get_allowed_value_types(_property);
		
		// Check to see if a transition exists for this value, and destroy it
		for(var transition_index = 0; transition_index < ds_list_size(__transition_list); transition_index++) {
			
			// Get property to check
			var transition_property = __transition_list[|transition_index].property;
			
			if(transition_property == _property) {
				
				// Force-set property for continuity
				properties[transition_property] = get_property(transition_property);
				ds_list_delete(__transition_list, transition_index--);
				
			} else if(__gmcss_style_property_is_multiprop(transition_property, _property)) {
				
				#region Multiprops
				
				switch(_property) {
					
					case GMCSS_STYLE_PROPERTIES.PADDING:
					
						properties[GMCSS_STYLE_PROPERTIES.PADDING_TOP]		= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM]	= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.PADDING_LEFT]		= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.PADDING_RIGHT]	= get_property(transition_property);

					break;
		
					case GMCSS_STYLE_PROPERTIES.MARGIN:
					
						properties[GMCSS_STYLE_PROPERTIES.MARGIN_TOP]		= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM]	= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.MARGIN_LEFT]		= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT]		= get_property(transition_property);
		
					break;
		
					case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH:
						
						properties[GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP]		= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM]	= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT]	= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT]	= get_property(transition_property);
						
					break;
		
					case GMCSS_STYLE_PROPERTIES.SIZE:
					
						properties[GMCSS_STYLE_PROPERTIES.WIDTH]	= get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.HEIGHT]	= get_property(transition_property);

					break;
		
					case GMCSS_STYLE_PROPERTIES.SCALE:
					
						properties[GMCSS_STYLE_PROPERTIES.SCALE_X] = get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.SCALE_Y] = get_property(transition_property);
						
					break;
		
					case GMCSS_STYLE_PROPERTIES.ORIGIN:
					
						properties[GMCSS_STYLE_PROPERTIES.ORIGIN_X] = get_property(transition_property);
						properties[GMCSS_STYLE_PROPERTIES.ORIGIN_Y] = get_property(transition_property);

					break;
					
				}
				
				#endregion
				
				ds_list_delete(__transition_list, transition_index--);
			}
			
		}
		
		// Set property
		__set_property_internal(_property, _value, allowed_types);
		
	}
	
	static get_property = function(_property) {
		
		// Check to see if a transition exists for this value
		var transition_exists = false;
		var transition = undefined;
		
		for(var transition_index = 0; transition_index < ds_list_size(__transition_list); transition_index++) {
			
			if(__transition_list[|transition_index].property == _property) {
				transition_exists = true;
				transition = __transition_list[|transition_index];
				break;
			}
			
		}
		
		// No transition for property exists - get static value
		if(!transition_exists) {

			#region Multiprops
				
			switch(_property) {
					
				case GMCSS_STYLE_PROPERTIES.PADDING:
					
					return {
						top:	get_property(GMCSS_STYLE_PROPERTIES.PADDING_TOP),
						bottom: get_property(GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM),
						left:	get_property(GMCSS_STYLE_PROPERTIES.PADDING_LEFT),
						right:	get_property(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT),
					};
		
				case GMCSS_STYLE_PROPERTIES.MARGIN:
					
					return {
						top:	get_property(GMCSS_STYLE_PROPERTIES.MARGIN_TOP),
						bottom: get_property(GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM),
						left:	get_property(GMCSS_STYLE_PROPERTIES.MARGIN_LEFT),
						right:	get_property(GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT),
					};
					
				case GMCSS_STYLE_PROPERTIES.BORDER:
						
					return {
						top:	get_property(GMCSS_STYLE_PROPERTIES.BORDER_TOP),
						bottom: get_property(GMCSS_STYLE_PROPERTIES.BORDER_BOTTOM),
						left:	get_property(GMCSS_STYLE_PROPERTIES.BORDER_LEFT),
						right:	get_property(GMCSS_STYLE_PROPERTIES.BORDER_RIGHT),
					};

				case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH:
						
					return {
						top:	get_property(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP),
						bottom: get_property(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM),
						left:	get_property(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT),
						right:	get_property(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT),
					};
		
				case GMCSS_STYLE_PROPERTIES.SIZE:
					
					return {
						width:	get_property(GMCSS_STYLE_PROPERTIES.WIDTH),
						height: get_property(GMCSS_STYLE_PROPERTIES.HEIGHT),
					};
		
				case GMCSS_STYLE_PROPERTIES.SCALE:
					
					return {
						x:	get_property(GMCSS_STYLE_PROPERTIES.SCALE_X),
						y: get_property(GMCSS_STYLE_PROPERTIES.SCALE_Y),
					};
		
				case GMCSS_STYLE_PROPERTIES.ORIGIN:
					
					return {
						x:	get_property(GMCSS_STYLE_PROPERTIES.ORIGIN_X),
						y: get_property(GMCSS_STYLE_PROPERTIES.ORIGIN_Y),
					};
					
			}
				
			#endregion
		
			// Get property
			return properties[_property];
		
		} else {
			
			return __gmcss_style_read_timing_function(properties[_property], transition);
			
		}

	}
	
	static transition = function(_property, _new_value, _duration = 60, _timing_function = GMCSS_STYLE_TIMING_FUNCTIONS.LINEAR) {
		
		#region Props not allowed
		
		if(_property == GMCSS_STYLE_PROPERTIES.BORDER) {
			var property_name = __gmcss_style_property_to_string(_property);
			__gmcss_error(__GMCSS_ERROR_PREFIX_GENERAL + $"Transitions for property \"{property_name}\" are not supported.");
		}
		
		#endregion
		
		#region Multiprops
				
		switch(_property) {
					
			case GMCSS_STYLE_PROPERTIES.PADDING:
					
				transition(GMCSS_STYLE_PROPERTIES.PADDING_TOP,		_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM,	_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.PADDING_LEFT,		_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT,	_new_value, _duration, _timing_function);

			break;
		
			case GMCSS_STYLE_PROPERTIES.MARGIN:
					
				transition(GMCSS_STYLE_PROPERTIES.MARGIN_TOP,		_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM,	_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.MARGIN_LEFT,		_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT,		_new_value, _duration, _timing_function);
		
			break;

			case GMCSS_STYLE_PROPERTIES.BORDER_WIDTH:
						
				transition(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP,		_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM,	_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT,	_new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT,	_new_value, _duration, _timing_function);
						
			break;
		
			case GMCSS_STYLE_PROPERTIES.SIZE:
					
				transition(GMCSS_STYLE_PROPERTIES.WIDTH, _new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.HEIGHT, _new_value, _duration, _timing_function);
			
				exit;

			break;
		
			case GMCSS_STYLE_PROPERTIES.SCALE:
					
				transition(GMCSS_STYLE_PROPERTIES.SCALE_X, _new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.SCALE_Y, _new_value, _duration, _timing_function);
			
				exit;
						
			break;
		
			case GMCSS_STYLE_PROPERTIES.ORIGIN:
					
				transition(GMCSS_STYLE_PROPERTIES.ORIGIN_X, _new_value, _duration, _timing_function);
				transition(GMCSS_STYLE_PROPERTIES.ORIGIN_Y, _new_value, _duration, _timing_function);
			
				exit;

			break;
					
		}
				
		#endregion

		// Validate incoming value
		__gmcss_style_property_value_validate(_new_value);
		
		// Get allowed types for property
		var allowed_types = __gmcss_style_property_get_allowed_value_types(_property);
		
		// Check to see if a transition exists for this value, and destroy it
		for(var transition_index = 0; transition_index < ds_list_size(__transition_list); transition_index++) {
			
			// Get property to check
			var transition_property = __transition_list[|transition_index].property;
			
			if(transition_property == _property) {
				
				// Force-set property for continuity
				properties[transition_property] = get_property(transition_property);
				ds_list_delete(__transition_list, transition_index--);
			}
			
		}
		
		// Only allow transitions for number types
		// TODO: Add percents
		if(array_contains(allowed_types, GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER)) {
			
			// Get curve from enum
			var timing_function_curve = GMCSS_STYLE_TIMING_FUNCTIONS.LINEAR;
			
			switch(_timing_function) {
				case GMCSS_STYLE_TIMING_FUNCTIONS.LINEAR:		timing_function_curve = __gmcss_timing_function_linear;			break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.EASE:			timing_function_curve = __gmcss_timing_function_ease;			break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.CUBIC:		timing_function_curve = __gmcss_timing_function_cubic;			break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.QUART:		timing_function_curve = __gmcss_timing_function_quart;			break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.EXPO:			timing_function_curve = __gmcss_timing_function_expo;			break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.CIRC:			timing_function_curve = __gmcss_timing_function_circ;			break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.BACK:			timing_function_curve = __gmcss_timing_function_back;			break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC:		timing_function_curve = __gmcss_timing_function_elastic;		break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.BOUNCE:		timing_function_curve = __gmcss_timing_function_bounce;			break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.FAST_TO_SLOW:	timing_function_curve = __gmcss_timing_function_fast_to_slow;	break;
				case GMCSS_STYLE_TIMING_FUNCTIONS.MID_SLOW:		timing_function_curve = __gmcss_timing_function_mid_slow;		break;
			}

			// Add transition to transition list
			ds_list_add(__transition_list, {
				property: _property,
				new_value: _new_value,
				duration: _duration,
				timer: 0,
				timing_function: timing_function_curve
			});
			
		} else {
			// TODO: Add percent to error message
			__gmcss_error(__GMCSS_ERROR_PREFIX_GENERAL + $"Cannot initiate a style transition with value \"{_new_value}\"! Only number property value types are accepted.");
		}
		
	}
	
	#endregion
	
	#region Rules
	
	ruleset = {
		allow_negative_padding:		GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_PADDING,		// Whether negative padding is allowed on the element
		allow_negative_margin:		GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_MARGIN,		// Whether negative margin is allowed on the element
		allow_negative_size:		GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_SIZE,		// Whether a negative width or height is allowed on the element
		allow_negative_line_height: GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_LINE_HEIGHT,	// Whether a negative line height is allowed on the element
		allow_negative_scale:		GMCSS_DEFAULT_RULES_ALLOW_NEGATIVE_SCALE,		// Whether a negative scale is allowed on the element
		clamp_alpha:				GMCSS_DEFAULT_RULES_CLAMP_ALPHA,				// Whether alpha values are clamped from 0.0 to 1.0
	};
	
	#endregion
	
	#region __private
	
	__transition_list = ds_list_create();	// List of transitions to apply to this style struct
	__animation_list = ds_list_create();	// List of animations to apply to this style struct
	
	static __step = function() {
		
		#region Process transitions
		
		for(var transition_index = 0; transition_index < ds_list_size(__transition_list); transition_index++) {
			
			// Increment transition timer
			__transition_list[|transition_index].timer += __GMCSS_DELTA_TIME * (__transition_list[|transition_index].duration / 60);
			
			// If transition is over, set static value and delete transition container
			if(__transition_list[|transition_index].timer >= 1) {

				properties[__transition_list[|transition_index].property] = __transition_list[|transition_index].new_value;
				ds_list_delete(__transition_list, transition_index--);

			}
			
		}
		
		#endregion
		
	}
	
	static __cleanup = function() {
		
		if(ds_exists(__transition_list, ds_type_list)) {
			ds_list_destroy(__transition_list);
		}
		
		if(ds_exists(__animation_list, ds_type_list)) {
			ds_list_destroy(__animation_list);
		}
		
	}
	
	static __set_property_internal = function(_property, _value, _allowed_types = []) {
		
		#region Multiprops
		
		// Padding
		if(_property == GMCSS_STYLE_PROPERTIES.PADDING) {
			
			__set_property_internal(GMCSS_STYLE_PROPERTIES.PADDING_TOP,		_value,	_allowed_types);
			__set_property_internal(GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM,	_value, _allowed_types);
			__set_property_internal(GMCSS_STYLE_PROPERTIES.PADDING_LEFT,	_value, _allowed_types);
			__set_property_internal(GMCSS_STYLE_PROPERTIES.PADDING_RIGHT,	_value, _allowed_types);
			
			exit;
			
		}
		
		// Margin
		if(_property == GMCSS_STYLE_PROPERTIES.MARGIN) {
			
			__set_property_internal(GMCSS_STYLE_PROPERTIES.MARGIN_TOP,		_value,	_allowed_types);
			__set_property_internal(GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM,	_value, _allowed_types);
			__set_property_internal(GMCSS_STYLE_PROPERTIES.MARGIN_LEFT,		_value, _allowed_types);
			__set_property_internal(GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT,	_value, _allowed_types);
			
			exit;
			
		}
		
		// Size
		if(_property == GMCSS_STYLE_PROPERTIES.SIZE) {
			
			__set_property_internal(GMCSS_STYLE_PROPERTIES.WIDTH,	_value,	_allowed_types);
			__set_property_internal(GMCSS_STYLE_PROPERTIES.HEIGHT,	_value, _allowed_types);
			
			exit;
			
		}
		
		// Size
		if(_property == GMCSS_STYLE_PROPERTIES.ORIGIN) {
			
			__set_property_internal(GMCSS_STYLE_PROPERTIES.ORIGIN_X,	_value,	_allowed_types);
			__set_property_internal(GMCSS_STYLE_PROPERTIES.ORIGIN_Y,	_value, _allowed_types);
			
			exit;
			
		}
		
		// Border width
		if(_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH) {

			switch(typeof(_value)) {
				
				case "number":
					__set_property_internal(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP,	_value,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM,	_value,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT,	_value,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT,	_value,	_allowed_types);
				break;
				
				case "struct":
					__set_property_internal(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP,	_value.top,		_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM,	_value.bottom,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT,	_value.left,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT,	_value.right,	_allowed_types);
				break;
				
			}
			
			exit;
			
		}
		
		// Scale
		if(_property == GMCSS_STYLE_PROPERTIES.SCALE) {
			
			switch(typeof(_value)) {
				
				case "number":
					__set_property_internal(GMCSS_STYLE_PROPERTIES.SCALE_X,	_value,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.SCALE_Y,	_value,	_allowed_types);
				break;
				
				case "struct":
					__set_property_internal(GMCSS_STYLE_PROPERTIES.SCALE_X,	_value.x,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.SCALE_Y,	_value.y,	_allowed_types);
				break;
				
			}
			
			exit;
			
		}
		
		// Origin
		if(_property == GMCSS_STYLE_PROPERTIES.ORIGIN) {
			
			switch(typeof(_value)) {
				
				case "number":
					__set_property_internal(GMCSS_STYLE_PROPERTIES.ORIGIN_X,	_value,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.ORIGIN_Y,	_value,	_allowed_types);
				break;
				
				case "struct":
					__set_property_internal(GMCSS_STYLE_PROPERTIES.ORIGIN_X,	_value.x,	_allowed_types);
					__set_property_internal(GMCSS_STYLE_PROPERTIES.ORIGIN_Y,	_value.y,	_allowed_types);
				break;
				
			}
			
			exit;
			
		}
		
		#endregion
	
		// Get value type
		var value_type = __gmcss_style_property_value_get_type(_value);
		
		// Get property name
		var property_name = __gmcss_style_property_to_string(_property);
	
		// __gmcss_error on incorrect type - only if "any" is not applied
		if(!array_contains(_allowed_types, GMCSS_STYLE_PROPERTY_VALUE_TYPES.ANY)) {
			if(!array_contains(_allowed_types, value_type)) {
				__gmcss_error(__GMCSS_ERROR_PREFIX_GENERAL + $"\"{_value}\" is not a valid value for property \"{property_name}\"");
			}
		}
		
		#region Apply ruleset
	
		switch(value_type) {
		
			case GMCSS_STYLE_PROPERTY_VALUE_TYPES.NUMBER:
				
				// Padding rules
				if(
					_property == GMCSS_STYLE_PROPERTIES.PADDING_TOP		||
					_property == GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM	||
					_property == GMCSS_STYLE_PROPERTIES.PADDING_LEFT	||
					_property == GMCSS_STYLE_PROPERTIES.PADDING_RIGHT
				) {
					if(!ruleset.allow_negative_padding) {
						_value = max(_value, 0);
					}
				}
				
				// Margin rules
				if(
					_property == GMCSS_STYLE_PROPERTIES.MARGIN_TOP		||
					_property == GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM	||
					_property == GMCSS_STYLE_PROPERTIES.MARGIN_LEFT		||
					_property == GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT
				) {
					if(!ruleset.allow_negative_margin) {
						_value = max(_value, 0);
					}
				}
				
				// Border rules
				if(
					_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_TOP	||
					_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_BOTTOM ||
					_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_LEFT	||
					_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH_RIGHT
				) {
					_value = max(_value, 0);
				}
				
				// Scale rules
				if(
					_property == GMCSS_STYLE_PROPERTIES.SCALE_X	||
					_property == GMCSS_STYLE_PROPERTIES.SCALE_Y
				) {
					if(!ruleset.allow_negative_scale) {
						_value = max(_value, 0);
					}
				}

			break;
		
			case GMCSS_STYLE_PROPERTY_VALUE_TYPES.PERCENT:

				// Padding rules
				if(
					_property == GMCSS_STYLE_PROPERTIES.PADDING_TOP		||
					_property == GMCSS_STYLE_PROPERTIES.PADDING_BOTTOM	||
					_property == GMCSS_STYLE_PROPERTIES.PADDING_LEFT	||
					_property == GMCSS_STYLE_PROPERTIES.PADDING_RIGHT
				) {
					if(!ruleset.allow_negative_padding) {
						if(string_pos("-", string_trim(_value)) == 1) {
							_value = string(0) + GMCSS_VALUE_PROPERTY_PERCENT;	
						}
					}
				}
				
				// Margin rules
				if(
					_property == GMCSS_STYLE_PROPERTIES.MARGIN_TOP		||
					_property == GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM	||
					_property == GMCSS_STYLE_PROPERTIES.MARGIN_LEFT		||
					_property == GMCSS_STYLE_PROPERTIES.MARGIN_RIGHT
				) {
					if(!ruleset.allow_negative_margin) {
						if(string_pos("-", string_trim(_value)) == 1) {
							_value = string(0) + GMCSS_VALUE_PROPERTY_PERCENT;	
						}
					}
				}
				
			break;
			
			case GMCSS_STYLE_PROPERTY_VALUE_TYPES.AUTO:
				
			break;
			
			case GMCSS_STYLE_PROPERTY_VALUE_TYPES.STRUCT:
			
				// Border rules
				if(_property == GMCSS_STYLE_PROPERTIES.BORDER_WIDTH) {
					
				}
			
			break

		}
		
		#endregion
		
		// Set property
		properties[_property] = _value;

	}

	static __get_font_height = function() {
		
		if(font_get_info(get_property(GMCSS_STYLE_PROPERTIES.FONT_FAMILY)) == undefined) {
			__gmcss_error(__GMCSS_ERROR_PREFIX_GENERAL + $"Tried to measure the height of a style's font, but the font was invalid!");
		}
		
		// Store the previous font and switch fonts
		var prev_font = draw_get_font();
		draw_set_font(get_property(GMCSS_STYLE_PROPERTIES.FONT_FAMILY));
		
		// Measure the font height
		var font_height = string_height("X");
		
		// Reset the current font
		draw_set_font(prev_font);
		
		// Return the font height
		return font_height;
		
	}

	static __get_total_line_height = function() {

		return __get_font_height() + get_property(GMCSS_STYLE_PROPERTIES.LINE_HEIGHT);
		
	}
	
	static __border_is_flush = function() {
		
		// Get side borders & widths
		var sides = get_property(GMCSS_STYLE_PROPERTIES.BORDER);
		var border_width = get_property(GMCSS_STYLE_PROPERTIES.BORDER_WIDTH);

		// Return whether all sides have a border, and their border width is equal
		return 
			(sides.top && sides.bottom && sides.left && sides.right) &&
			(
				border_width.top	== border_width.bottom	&&
				border_width.bottom == border_width.left	&&
				border_width.left	== border_width.right	&&
				border_width.right	== border_width.top
			);
		
	}
	
	#endregion
	
}

