

class HTMLButton extends Simditor.Button

  name: 'html'

  icon: 'html5'

  needFocus: false

  _init: ->
    super()

    @editor.textarea.on 'focus', (e) =>
      @editor.el.addClass('focus')
        .removeClass('error')

    @editor.textarea.on 'blur', (e) =>
      @editor.el.removeClass 'focus'
      @editor.setValue @editor.textarea.val()

    @editor.textarea.on 'input', (e) =>
      @_resizeTextarea()

  status: ->

  command: ->
    @editor.blur()
    @editor.el.toggleClass 'simditor-html'
    @editor.htmlMode = @editor.el.hasClass 'simditor-html'

    if @editor.htmlMode
      @editor.hidePopover()
      @editor.textarea.val @beautifyHTML(@editor.textarea.val())
      @_resizeTextarea()
    else
      @editor.setValue @editor.textarea.val()

    for button in @editor.toolbar.buttons
      if button.name == 'html'
        button.setActive @editor.htmlMode
      else
        button.setDisabled @editor.htmlMode

    null

  beautifyHTML: (args...) ->
    if beautify.html
      beautify.html args...
    else
      beautify args...

  _resizeTextarea: ->
    @_textareaPadding ||= @editor.textarea.innerHeight() - @editor.textarea.height()
    @editor.textarea
      .height(@editor.textarea[0].scrollHeight - @_textareaPadding)

Simditor.Toolbar.addButton HTMLButton
