require_relative 'fragment_parser'

module IKnowWhereYouLive
	module ParsingHooks
		def after_render_template(output, context, options)
			renderer = TemplateRenderer.new(@lookup_context)
      template = renderer.determine_template(options)
      FragmentParser.add_metadata(output, template, true)
		end

		def after_render_template(output, context, options, &block)
			renderer = PartialRenderer.new(@lookup_context)
      partial = renderer.send(:find_partial)
      FragmentParser.add_metadata(output, partial, false)
		end
	end
end