module IKnowWhereYouLive
	module RenderHooks
		def render_template(context, options)
			output = super
			after_render_template(output, context, options)
		end

		def render_partial(context, options, &block)
			output = super
			after_render_partial(context, options, block)
		end

		def after_render_template(output, context, options)
			raise NotImplementedError
		end

		def after_render_partial(output, context, options, &block)
		  raise NotImplementedError
		end
	end
end