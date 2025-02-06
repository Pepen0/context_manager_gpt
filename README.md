

**README**
===============

**Chrome Extension Build Command**
---------------------------------

The following command is used to build the Chrome extension:

```bash
flutter build web \
  --release \
  --web-renderer canvaskit \
  --csp \
  --base-href "/" \
  --pwa-strategy=none
```

**Breakdown of the Command**
-----------------------------

* `flutter build web`: Builds the Flutter web application.
* `--release`: Builds the application in release mode, which optimizes the code for production.
* `--web-renderer canvaskit`: Specifies the web renderer to use. In this case, we're using CanvasKit, which is a high-performance rendering engine.
* `--csp`: Enables Content Security Policy (CSP) to define which sources of content are allowed to be executed within the web page.
* `--base-href "/"`: Sets the base URL for the application. In this case, we're setting it to the root URL (`"/"`) to ensure that the application is served from the correct location.
* `--pwa-strategy=none`: Disables Progressive Web App (PWA) functionality, as we're building a Chrome extension and not a PWA.