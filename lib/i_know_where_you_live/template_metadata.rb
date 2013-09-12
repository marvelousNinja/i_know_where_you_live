require_relative 'html_parser'

module IKnowWhereYouLive
	module TemplateMetadata
		def self.included(base)
			base.class_eval do
				alias_method :original_render, :render

				def render(*args)
					output = original_render(*args)
					add_metadata(output, *args)
				end
			end
		end

		def add_metadata(output, context, options, block = nil)
		  partial = options.key?(:partial)
		  template = options.key?(:template)
		  fragment = partial ? send(:find_partial) : determine_template(options)
		  if (partial || template) && fragment.formats.include?(:html)
		    HTMLParser.add_metadata(output, fragment, partial)
		  else
			  output
		  end
		end
	end
end