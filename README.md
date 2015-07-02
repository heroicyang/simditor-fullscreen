simditor-fullscreen
=============

![](https://circleci.com/gh/heroicyang/simditor-fullscreen.png?circle-token=708d36ea11f7ab60fefd70031f870ba8f8fcce15)

Add fullscreen support for Simditor.

###Usage

Reference button and dependency script on your page with Simditor:

```html
<script type="text/javascript" src="/path/to/simditor-fullscreen.js"></script>

<link rel="stylesheet" href="/path/to/simditor-fullscreen.css" />
```

Add fullscreen button config when you initialize Simditor:

```coffeescript
editor = new Simditor
  textarea: $ '#txt-editor'
  toolbar: ['bold', 'italic', 'underline', '|', 'fullscreen']
```
