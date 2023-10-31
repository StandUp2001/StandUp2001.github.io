HTML="<!DOCTYPE html>
    <html lang='en'>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width,initial-scale=1'>

        <title>Svelte app</title>

        <link rel='icon' type='image/png' href='/favicon.png'>
        <link rel='stylesheet' href='/global.css'>
        <link rel='stylesheet' href='/build/bundle.css'>

        <script defer src='/build/bundle.js'></script>
    </head>

    <body>
    </body>
    </html>"

GLOBAL_CSS="html, body {
	position: relative;
	width: 100%;
	height: 100%;
    }

    body {
        color: #333;
        margin: 0;
        padding: 8px;
        box-sizing: border-box;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
    }

    a {
        color: rgb(0,100,200);
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    a:visited {
        color: rgb(0,80,160);
    }

    label {
        display: block;
    }

    input, button, select, textarea {
        font-family: inherit;
        font-size: inherit;
        -webkit-padding: 0.4em 0;
        padding: 0.4em;
        margin: 0 0 0.5em 0;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 2px;
    }

    input:disabled {
        color: #ccc;
    }

    button {
        color: #333;
        background-color: #f4f4f4;
        outline: none;
        background-color: #000;
    }

    button:disabled {
        color: #999;
    }

    button:not(:disabled):active {
        background-color: #ddd;
    }

    button:focus {
        border-color: #666;
    }
"

# The public folder is cleared and the site is built
rm -rf ./public
pnpm build
echo "$HTML" >./public/index.html
cat ./public/global.css
echo "$GLOBAL_CSS" >./public/global.css

# The content in public is copied to the root of the site
cp -r ./public/* ./

# Add the files to git
git add .
[ -z "$1" ] && git commit -m "Update" || git commit -m "$1"
git push

# Remove the files from the root of the site
rm index.html
rm global.css
rm -rf build
