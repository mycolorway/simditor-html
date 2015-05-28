simditor-html
=============

Add a HTML source editing button for Simditor. Use [js-beautify](https://github.com/beautify-web/js-beautify) for HTML formatting.

###Usage

Reference button and dependency script on your page with Simditor:

```html
<script type="text/javascript" src="[path]/beautify-html.js"></script>
<script type="text/javascript" src="[path]/simditor-html.js"></script>

<link rel="stylesheet" href="[path]/simditor-html.css" media="screen" charset="utf-8" />
```

Add html button config when you initialize Simditor:

```js
var editor = new Simditor({
  textarea: $('#txt-editor'),
  toolbar: ['bold', 'italic', 'underline', 'color', '|', 'ol', 'ul', '|', 'html']
});
```
