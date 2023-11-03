/* 									  */
/*                                    */
/*    ____ _____ ___  _______________ */
/*   / __ `/ __ `__ \/ ___/ ___/ ___/ */
/*  / /_/ / / / / / / /__(__  |__  )  */
/*  \__, /_/ /_/ /_/\___/____/____/   */
/* /____/                             */
/* 									  */
/* 									  */

function gmcss_element_create(_style_properties = {}) {
	
	// Create new element
	var element = instance_create_depth(0, 0, 0, obj_gmcss_element);
	
	// Map style properties in struct to new element
	__gmcss_style_map_properties(element.id, _style_properties);
	
	// Return element
	return element;
	
}

function gmcss_element_create_text(_text = "", _style_properties = {}) {
	
	// Create new element
	var element = gmcss_element_create(_style_properties);
	
	// Set element text
	element.text = _text;
	
	// Return element
	return element;
	
}

function gmcss_dom_create(_x, _y, _depth, _style_properties = {}) {
	
	// Create new element
	var element = instance_create_depth(_x, _y, _depth, obj_gmcss_element);
	
	// Map style properties in struct to new element
	__gmcss_style_map_properties(element.id, _style_properties);
	
	// Return element
	return element;
	
}