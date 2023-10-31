HTML=$(cat ./public/index.html)
GLOBAL_CSS=$(cat ./public/global.css)

# The public folder is cleared and the site is built
rm -rf ./public
pnpm build
echo "$HTML" >./public/index.html
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
