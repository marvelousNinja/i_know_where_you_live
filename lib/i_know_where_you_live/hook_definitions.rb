module IKnowWhereYouLive
	module AfterRenderHooks
		def self.included(base)
			base.class_eval do
				alias_method :original_render_template, :render_template
				alias_method :original_render_partial, :render_partial

				def render_template(context, options)
					output = original_render_template(context, options)
					after_render_template(output, context, options)
				end

				def render_partial(context, options, &block)
					output = original_render_partial(context, options, &block)
					after_render_partial(output, context, options, &block)
				end
			end

			def after_render_template(output, context, options)
				raise NotImplementedError
			end

			def after_render_partial(output, context, options, &block)
			  raise NotImplementedError
			end
		end
	end
end