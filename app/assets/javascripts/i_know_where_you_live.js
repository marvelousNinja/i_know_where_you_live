(function() {
	path_attribute_name = 'data-rails-path';

  marked_elements = document.querySelectorAll('[' + path_attribute_name + ']');
  elements_count = marked_elements.length;
  color_by_path = {}

  for (var i = 0; i < elements_count; i++ ) {
  	element = marked_elements[i];
  	path = element.getAttribute(path_attribute_name);

  	if (!(color_by_path[path])) {
  		color_by_path[path] = "#"+((1<<24)*Math.random()|0).toString(16);
  	}

  	element.style.background = color_by_path[path];
  }
})();