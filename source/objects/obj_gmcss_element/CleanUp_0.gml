// Clean up style struct
style.__cleanup();

// Destroy all children 
for(var i = 0; i < ds_list_size(children); i++) {
	instance_destroy(children[| i]);	
}

// Destroy child list
if(ds_exists(children, ds_type_list)) {
	ds_list_destroy(children);
}

// Free draw surface
if(surface != undefined && surface_exists(surface)) {
	surface_free(surface);
}

// Destroy mouse events
if(ds_exists(mouse_events.enter, ds_type_list)) {
	ds_list_destroy(mouse_events.enter);
}

if(ds_exists(mouse_events.leave, ds_type_list)) {
	ds_list_destroy(mouse_events.leave);
}

if(ds_exists(mouse_events.click, ds_type_list)) {
	ds_list_destroy(mouse_events.click);
}