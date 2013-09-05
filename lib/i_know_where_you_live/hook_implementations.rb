require_relative 'fragment_parser'

module IKnowWhereYouLive
	module ParsingHooks
		# TODO: Deal with these scary things!
		# There must be a way to get template/partial path through public API
		# Without parsing any parameters and etc.
	  def after_render_template(output, context, options)
	  	renderer = ActionView::TemplateRenderer.new(lookup_context)
	  	details = renderer.send(:extract_details, options)
	  	renderer.instance_variable_set(:@details, details)
		  template = renderer.determine_template(options)
		  FragmentParser.add_metadata(output, template, true)
		end

		def after_render_partial(output, context, options, &block)
			renderer = ActionView::PartialRenderer.new(lookup_context)
			renderer.send(:setup, context, options, block)
		  partial = renderer.send(:find_partial)
		  FragmentParser.add_metadata(output, partial, false)
		end
	end
end