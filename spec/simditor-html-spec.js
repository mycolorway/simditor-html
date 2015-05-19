(function() {
  describe('A HTML extension for Simditor', function() {
    var $textarea, editor;
    editor = null;
    $textarea = null;
    beforeEach(function() {
      var content;
      content = '<p>Simditor 是团队协作工具 <a href="http://tower.im">Tower</a> 使用的富文本编辑器。</p>\n<p>相比传统的编辑器它的特点是：</p>\n<ul>\n  <li>功能精简，加载快速</li>\n  <li>输出格式化的标准 HTML</li>\n  <li>每一个功能都有非常优秀的使用体验</li>\n</ul>\n<p>兼容的浏览器：IE10+、Chrome、Firefox、Safari。</p>\n<pre>this is a code snippet</pre>\n<blockquote><p>First line</p><p><br/></p></blockquote>\n<hr/>\n<p><br/></p>';
      $textarea = $('<textarea id="editor"></textarea>').val(content).appendTo('body');
      return editor = new Simditor({
        textarea: $textarea,
        toolbar: ['html']
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
      button = editor.toolbar.findButton('html');
      return expect(button instanceof Simditor.Button).toBe(true);
    });
    it('should show html textarea when click the button', function() {
      var button;
      button = editor.toolbar.findButton('html');
      button.el.mousedown();
      expect(editor.body.is(':visible')).toBe(false);
      expect(editor.textarea.is(':visible')).toBe(true);
      return expect(editor.el.hasClass('simditor-html')).toBe(true);
    });
    return it('should parse html content when click button again', function() {
      var button;
      button = editor.toolbar.findButton('html');
      button.el.mousedown();
      editor.textarea.val('<div>paragraph 1</div><p>paragraph 2</p>');
      editor.textarea.blur();
      button.el.mousedown();
      return expect(editor.body.html()).toBe('<p>paragraph 1</p><p>paragraph 2</p>');
    });
  });

}).call(this);
