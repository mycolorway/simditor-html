
describe 'A HTML extension for Simditor', ->
  editor = null
  $textarea = null

  beforeEach ->
    content = '''
      <p>Simditor 是团队协作工具 <a href="http://tower.im">Tower</a> 使用的富文本编辑器。</p>
      <p>相比传统的编辑器它的特点是：</p>
      <ul>
        <li>功能精简，加载快速</li>
        <li>输出格式化的标准 HTML</li>
        <li>每一个功能都有非常优秀的使用体验</li>
      </ul>
      <p>兼容的浏览器：IE10+、Chrome、Firefox、Safari。</p>
      <pre>this is a code snippet</pre>
      <blockquote><p>First line</p><p><br/></p></blockquote>
      <hr/>
      <p><br/></p>
    '''

    $textarea = $('<textarea id="editor"></textarea>')
      .val(content)
      .appendTo 'body'
    editor = new Simditor
      textarea: $textarea
      toolbar: ['html']

  afterEach ->
    editor?.destroy()
    $textarea.remove()

  it 'is a Simditor button', ->
    button = editor.toolbar.findButton 'html'
    expect(button instanceof Simditor.Button).toBe(true)

  it 'should show html textarea when click the button', ->
    button = editor.toolbar.findButton 'html'
    button.el.mousedown()
    expect(editor.body.is(':visible')).toBe(false)
    expect(editor.textarea.is(':visible')).toBe(true)
    expect(editor.el.hasClass('simditor-html')).toBe(true)

  it 'should parse html content when click button again', ->
    button = editor.toolbar.findButton 'html'
    button.el.mousedown()

    editor.textarea.val '<div>paragraph 1</div><p>paragraph 2</p>'
    editor.textarea.blur()
    button.el.mousedown()

    expect(editor.body.html()).toBe('<p>paragraph 1</p><p>paragraph 2</p>')
