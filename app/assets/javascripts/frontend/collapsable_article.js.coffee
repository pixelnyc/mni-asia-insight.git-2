class window.CollapsableArticle
  constructor: (@articleEl) ->
    @id= @articleEl.data('post-id')
    @path = @articleEl.data('path')
    @contentArea = $(@articleEl.find('[data-text]'))
    @readMoreButton = $(@articleEl.find('[data-read-more]'))
    @readMoreButton.show()

    @initializeContent()
    @bindExpand()

  initializeContent: ->
    @contentArea.css({ height: '0' })


  bindExpand: ->
    @readMoreButton.on 'click', (e) =>
      e.preventDefault()
      @contentArea.css({ height: 'auto' })
      @readMoreButton.hide()

      if @path
        window.history.pushState('', '', @path)

      @markRead()

  markRead: ->
    $.post("/posts/#{@id}/mark-read")