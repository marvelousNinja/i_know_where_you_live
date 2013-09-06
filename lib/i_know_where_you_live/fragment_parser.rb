require 'nokogiri'

module IKnowWhereYouLive
	class FragmentParser
		class << self
			def add_metadata(output, fragment, partial)
				if fragment.type.html?
					rails_path = fragment.inspect

					parsed_html = Nokogiri::HTML.fragment(output)
					parsed_html.css(selector(partial)).each do |element|
						element['data-rails-path'] = rails_path
					end
					parsed_html.to_html.html_safe
				else
					output
				end
			end

			PARTIAL_SELECTOR = '*'
			TEMPLATE_SELECTOR = '*:not([data-rails-path])'

			def selector(partial)
				partial ? PARTIAL_SELECTOR : TEMPLATE_SELECTOR
			end
		end
  end
end