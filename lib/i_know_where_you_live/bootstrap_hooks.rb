class ActionView::Renderer
	include IKnowWhereYouLive::AfterRenderHooks
	include IKnowWhereYouLive::ParsingHooks
end