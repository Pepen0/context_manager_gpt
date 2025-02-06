**README**
===============

**Chrome Extension Build Command**
---------------------------------

The following command is used to build the Chrome extension:

```bash
flutter build web --release --web-renderer=html --csp --base-href "/" --pwa-strategy=none
```

**Breakdown of the Command**
-----------------------------

### 1. `flutter build web`

Builds the Flutter web application.

### 2. `--release`

Builds the application in release mode, which optimizes the code for production.

### 3. `--web-renderer=html`

Specifies the web renderer to use. In this case, we're using the HTML renderer.

### 4. `--csp`

Enables Content Security Policy (CSP) to define which sources of content are allowed to be executed within the web page.

### 5. `--base-href "/"`

Sets the base URL for the application. In this case, we're setting it to the root URL (`"/"`) to ensure that the application is served from the correct location.

### 6. `--pwa-strategy=none`

Disables Progressive Web App (PWA) functionality, as we're building a Chrome extension and not a PWA.

Note: I corrected the `--web-renderer` flag to match the actual command, which uses `html` instead of `canvaskit`.