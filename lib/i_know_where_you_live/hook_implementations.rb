require_relative 'fragment_parser'

module IKnowWhereYouLive
	module ParsingHooks
		def after_render_template(output, context, options)
	  	renderer = ActionView::TemplateRenderer.new(lookup_context)
	  	renderer.render(context, options)
	  	template = renderer.determine_template(options)
		  FragmentParser.add_metadata(output, template, true)
		end

		def after_render_partial(output, context, options, &block)
			renderer = ActionView::PartialRenderer.new(lookup_context)
			renderer.render(context, options)
			partial = renderer.send(:find_partial)
		  FragmentParser.add_metadata(output, partial, false)
		end
	end
end