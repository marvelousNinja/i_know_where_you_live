require 'nokogiri'

module IKnowWhereYouLive
	class HTMLParser
		class << self
			def add_metadata(output, fragment, partial)
				rails_path = fragment.inspect

				parsed_html = partial ? Nokogiri::HTML.fragment(output) : Nokogiri::HTML.parse(output)
				parsed_html.css(selector(partial)).each do |element|
					element['data-rails-path'] = rails_path
				end
				parsed_html.to_html.html_safe
			end

			PARTIAL_SELECTOR = '*'
			TEMPLATE_SELECTOR = '*:not([data-rails-path])'

			def selector(partial)
				partial ? PARTIAL_SELECTOR : TEMPLATE_SELECTOR
			end
		end
  end
end