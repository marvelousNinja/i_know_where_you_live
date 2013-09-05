require 'nokogiri'

module IKnowWhereYouLive
	class FragmentParser
		class << self
			def add_metadata(output, fragment, is_template)
				if fragment.type.html?
					rails_path = fragment.inspect
					global_path = fragment.identifier

					parsed_html = Nokogiri::HTML.fragment(output)
					parsed_html.css(selector(is_template)).each do |element|
						element['data-rails-path'] = rails_path
						element['data-global-path'] = global_path
					end
					parsed_html.to_html.html_safe
				else
					output
				end
			end

			TEMPLATE_SELECTOR = '*:not([data-rails-path])'
			PARTIAL_SELECTOR = '*'

			def selector(is_template)
				is_template ? TEMPLATE_SELECTOR : PARTIAL_SELECTOR
			end
		end
  end
end