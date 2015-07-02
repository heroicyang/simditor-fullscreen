
class SimditorFullscreen extends Simditor.Button

  @cls: 'simditor-fullscreen'
  @i18n:
    'zh-CN':
      fullscreen: '全屏'

  name: 'fullscreen'
  needFocus: false

  # icon: ''
  # temporary solution
  iconClassOf: ->
    'icon-fullscreen'

  _init: ->
    super()

    @window = $ window
    @body = $ 'body'
    @editable = @editor.body
    @toolbar = @editor.toolbar.wrapper

  status: ->
    @setActive @body.hasClass @constructor.cls

  command: ->
    @body.toggleClass @constructor.cls
    isFullscreen = @body.hasClass @constructor.cls

    if isFullscreen
      editablePadding = @editable.outerHeight() - @editable.height()

      @window.on "resize.simditor-fullscreen-#{@editor.id}", () =>
        @_resize
          height: @window.height() - @toolbar.outerHeight() - editablePadding
      .resize()
    else
      @window.off("resize.simditor-fullscreen-#{@editor.id}").resize()

      @_resize
        height: 'auto'

    @setActive isFullscreen

  _resize: (size) ->
    @editable.height size.height

Simditor.Toolbar.addButton SimditorFullscreen
