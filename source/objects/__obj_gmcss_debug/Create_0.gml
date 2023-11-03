test_ball = instance_create_depth(0, 0, 0, __obj_gmcss_ball);

test_dom = gmcss_dom_create(
	100, 
	100,
	0,
	{
		width: 100,
		height: "auto",
		bg_color: c_black,
		bg_alpha: .5,
	}
);

test_child_element_1 = gmcss_element_create_text(
	"Radius +",
	{
		width: "100%",
		height: 25,
		bg_color: c_white,
		text_color: c_black,
		cursor: cr_handpoint,
	}
);

test_child_element_2 = gmcss_element_create_text(
	"Radius -",
	{
		width: "100%",
		height: 25,
		bg_color: c_white,
		text_color: c_black,
		cursor: cr_handpoint,
	}
);

test_child_element_3 = gmcss_element_create_text(
	"Speed +",
	{
		width: "100%",
		height: 25,
		bg_color: c_white,
		text_color: c_black,
		cursor: cr_handpoint,
	}
);

test_child_element_4 = gmcss_element_create_text(
	"Speed -",
	{
		width: "100%",
		height: 25,
		bg_color: c_white,
		text_color: c_black,
		margin_bottom: 0,
		cursor: cr_handpoint,
	}
);

test_dom.add_child(test_child_element_1);
test_dom.add_child(test_child_element_2);
test_dom.add_child(test_child_element_3);
test_dom.add_child(test_child_element_4);

test_child_element_1.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	global.gmcss_ball_radius += 10;
	
	with(test_child_element_1) {
		style.set_property(GMCSS_STYLE_PROPERTIES.SCALE, .85);
		style.transition(GMCSS_STYLE_PROPERTIES.SCALE, 1, 2, GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC);
	}
	
});

test_child_element_2.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	global.gmcss_ball_radius -= 10;
	
	with(test_child_element_2) {
		style.set_property(GMCSS_STYLE_PROPERTIES.SCALE, .85);
		style.transition(GMCSS_STYLE_PROPERTIES.SCALE, 1, 2, GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC);
	}

});

test_child_element_3.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	global.gmcss_ball_orbit_speed += 1;
	
	with(test_child_element_3) {
		style.set_property(GMCSS_STYLE_PROPERTIES.SCALE, .85);
		style.transition(GMCSS_STYLE_PROPERTIES.SCALE, 1, 2, GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC);
	}
	
});

test_child_element_4.add_event(GMCSS_ELEMENT_EVENTS.MOUSE_CLICK, function() {
	
	global.gmcss_ball_orbit_speed -= 1;
	
	with(test_child_element_4) {
		style.set_property(GMCSS_STYLE_PROPERTIES.SCALE, .85);
		style.transition(GMCSS_STYLE_PROPERTIES.SCALE, 1, 2, GMCSS_STYLE_TIMING_FUNCTIONS.ELASTIC);
	}

});