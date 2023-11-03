/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

/// @desc  Maps variable definition properties set when creating a gmcss element to the style struct inside that element.
/// @param _element				{Id.Instance}	The element whose properties to map.
/// @param _style_properties	{Struct}		The struct of style properties to map.
function __gmcss_style_map_properties(_element, _style_properties = {}) {
	
	for(var i = 0; i < GMCSS_STYLE_PROPERTIES.__COUNT; i++) {

		var property_name =  __gmcss_style_property_to_string(i);
		
		if(variable_struct_exists(_style_properties, property_name)) {
			_element.style.set_property(i, variable_struct_get(_style_properties, property_name));
		}
		
	}

}