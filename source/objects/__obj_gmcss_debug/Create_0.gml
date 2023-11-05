test_ball = instance_create_depth(0, 0, 0, __obj_gmcss_ball);

test_dom = gmcss_dom_create(
	100, 
	100,
	0,
	{
		width: 200,
		height: "auto",
		background_color: c_black,
		bg_alpha: .5,
	}
);

test_child_element_title = gmcss_element_create_text(
	"Red Circle",
	{
		width: "100%",
		padding: 0,
		margin: 0,
		height: 25,
	}
);

test_child_element_1 = gmcss_element_create_text(
	"",
	{
		width: "100%",
		height: 25,
		background_image: __spr_gmcss_background_default,
		text_color: c_black,
		cursor: cr_handpoint,
	}
);

test_child_element_2 = gmcss_element_create_text(
	"Radius -",
	{
		width: "100%",
		height: 25,
		background_color: c_white,
		text_color: c_black,
		cursor: cr_handpoint,
	}
);

test_child_element_3 = gmcss_element_create_text(
	"Speed +",
	{
		width: "100%",
		height: 25,
		background_color: c_white,
		text_color: c_black,
		cursor: cr_handpoint,
	}
);

test_child_element_4 = gmcss_element_create_text(
	"Speed -",
	{
		width: "100%",
		height: 25,
		background_color: c_white,
		text_color: c_black,
		cursor: cr_handpoint,
	}
);

test_child_element_5 = gmcss_element_create({
	width: "100%",
	height: 50,
	background_color: c_red,
	margin_bottom: 0,
	padding: 0,
	display: "flex",
});


#region Flex elements

test_flex_element_1 = gmcss_element_create({
	width: "auto",
	height: "100%",
	background_color: c_yellow,
	margin: 0,
	margin_right: 10,
	padding: 0,
});

test_flex_element_2 = gmcss_element_create({
	width: "auto",
	height: "100%",
	background_color: c_green,
	margin: 0,
	margin_right: 10,
	padding: 0,
});

test_flex_element_3 = gmcss_element_create({
	width: "auto",
	height: "100%",
	background_color: c_blue,
	margin: 0,
	padding: 0,
});

test_child_element_5.add_child(test_flex_element_1);
test_child_element_5.add_child(test_flex_element_2);
test_child_element_5.add_child(test_flex_element_3);

#endregion

test_dom.add_child(test_child_element_title);
test_dom.add_child(test_child_element_1);
test_dom.add_child(test_child_element_2);
test_dom.add_child(test_child_element_3);
test_dom.add_child(test_child_element_4);
test_dom.add_child(test_child_element_5);

test_child_element_1.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	global.gmcss_ball_radius += 20;
	
	with(test_child_element_1) {
		
		style.set_property(GMCSS_STYLE_PROPERTIES.SCALE, .85);
		style.transition(GMCSS_STYLE_PROPERTIES.SCALE, 1, 2, GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC);
		
		style.set_property(GMCSS_STYLE_PROPERTIES.OFFSET_X, 20);
		style.transition(GMCSS_STYLE_PROPERTIES.OFFSET_X, 0, .2, GMCSS_STYLE_TIMING_FUNCTIONS.BOUNCE);
		
	}
	
});

test_child_element_1.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	with(test_child_element_title) {
		style.transition(GMCSS_STYLE_PROPERTIES.MARGIN_BOTTOM, 100, .2, GMCSS_STYLE_TIMING_FUNCTIONS.BOUNCE);
	}
	
});

test_child_element_2.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	global.gmcss_ball_radius -= 20;
	
	with(test_child_element_2) {
		
		style.set_property(GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR, c_red);
		style.transition(GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR, c_white, .2, GMCSS_STYLE_TIMING_FUNCTIONS.LINEAR);
		
		style.set_property(GMCSS_STYLE_PROPERTIES.SCALE, .1);
		style.transition(GMCSS_STYLE_PROPERTIES.SCALE, 1, .2, GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC);
		
		//style.set_property(GMCSS_STYLE_PROPERTIES.OFFSET_X, -20);
		//style.transition(GMCSS_STYLE_PROPERTIES.OFFSET_X, 0, .2, GMCSS_STYLE_TIMING_FUNCTIONS.BOUNCE);
		
	}

});

test_child_element_3.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	global.gmcss_ball_orbit_speed += 10;
	
	with(test_child_element_3) {
		
		style.set_property(GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR, c_lime);
		style.transition(GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR, c_white, .2, GMCSS_STYLE_TIMING_FUNCTIONS.LINEAR);
		
		style.set_property(GMCSS_STYLE_PROPERTIES.SCALE, .85);
		style.transition(GMCSS_STYLE_PROPERTIES.SCALE, 1, .2, GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC);
		
		style.set_property(GMCSS_STYLE_PROPERTIES.OFFSET_Y, -20);
		style.transition(GMCSS_STYLE_PROPERTIES.OFFSET_Y, 0, .2, GMCSS_STYLE_TIMING_FUNCTIONS.BOUNCE);
		
	}
	
});

test_child_element_4.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	global.gmcss_ball_orbit_speed -= 10;
	
	with(test_child_element_4) {
		
		style.set_property(GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR, c_red);
		style.transition(GMCSS_STYLE_PROPERTIES.BACKGROUND_COLOR, c_white, .2, GMCSS_STYLE_TIMING_FUNCTIONS.LINEAR);
		
		style.set_property(GMCSS_STYLE_PROPERTIES.SCALE, .85);
		style.transition(GMCSS_STYLE_PROPERTIES.SCALE, 1, .2, GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC);
		
		style.set_property(GMCSS_STYLE_PROPERTIES.OFFSET_Y, 20);
		style.transition(GMCSS_STYLE_PROPERTIES.OFFSET_Y, 0, .2, GMCSS_STYLE_TIMING_FUNCTIONS.BOUNCE);
		
	}

});