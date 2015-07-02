(function() {
  describe('Simditor Fullscreen', function() {
    var $textarea, editor;
    editor = null;
    $textarea = null;
    beforeEach(function() {
      $textarea = $('<textarea id="editor"></textarea>').appendTo('body');
      return editor = new Simditor({
        textarea: $textarea,
        toolbar: ['fullscreen']
      });
    });
    afterEach(function() {
      if (editor != null) {
        editor.destroy();
      }
      return $textarea.remove();
    });
    it('is a Simditor button', function() {
      var button;
      button = editor.toolbar.findButton('fullscreen');
      return expect(button instanceof Simditor.Button).toBe(true);
    });
    return it('should toggleClass on the body when click the button', function() {
      var button;
      button = editor.toolbar.findButton('fullscreen');
      button.el.trigger('mousedown');
      expect($('body').hasClass('simditor-fullscreen')).toBe(true);
      button.el.trigger('mousedown');
      return expect($('body').hasClass('simditor-fullscreen')).toBe(false);
    });
  });

}).call(this);
