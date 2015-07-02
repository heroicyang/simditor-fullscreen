
describe 'Simditor Fullscreen', ->
  editor = null
  $textarea = null

  beforeEach ->
    $textarea = $('<textarea id="editor"></textarea>').appendTo 'body'
    editor = new Simditor
      textarea: $textarea
      toolbar: ['fullscreen']

  afterEach ->
    editor?.destroy()
    $textarea.remove()

  it 'is a Simditor button', ->
    button = editor.toolbar.findButton 'fullscreen'
    expect(button instanceof Simditor.Button).toBe(true)

  it 'should toggleClass on the body when click the button', ->
    button = editor.toolbar.findButton 'fullscreen'

    button.el.trigger 'mousedown'
    expect($('body').hasClass('simditor-fullscreen')).toBe(true)

    button.el.trigger 'mousedown'
    expect($('body').hasClass('simditor-fullscreen')).toBe(false)
