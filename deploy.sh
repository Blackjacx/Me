#!/bin/bash

# Configuration (fully parameterized)
CMD=${1:-generate}
PACKAGE_NAME=${2:-"YourSwiftPackage"}
DOCS_DIR=${3:-"docs"}
BRANCH=${4:-"gh-pages"}
REPO_URL=${5:-"git@github.com:yourusername/yourrepo.git"}
PORT=${6:-8080}

# Generate DocC documentation
function generate_docs() {
    echo "Generating DocC documentation for $PACKAGE_NAME..."
    swift package --allow-writing-to-directory "$DOCS_DIR" generate-documentation \
        --target "$PACKAGE_NAME" \
        --disable-indexing \
        --transform-for-static-hosting \
        --output-path "$DOCS_DIR" \
        --hosting-base-path "."
    echo "Documentation generated in $DOCS_DIR."

    echo "Override index.html for redirection to subfolder documentation/Me"

cat <<EOF > docs/index.html
echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redirecting...</title>
    <meta http-equiv="refresh" content="0; url=/documentation/me/">
    <script type="text/javascript">
        window.location.href = "/documentation/me/";
    </script>
</head>
<body>
    <p>If you are not redirected automatically, follow this <a href="/documentation/me/">Link</a>.</p>
</body>
</html>'
EOF
    
    echo "Ensure files like CSS are not ignored by GitHub Pages"
    touch docs/.nojekyll
}

# Deploy to GitHub Pages
function deploy() {
    echo "Deploying documentation to GitHub Pages..."
    git checkout --orphan "$BRANCH"
    git rm -rf .
    mv "$DOCS_DIR"/* .
    rm -rf "$DOCS_DIR"
    touch .nojekyll  # Ensure files like CSS are not ignored by GitHub Pages
    git add .
    git commit -m "Deploy updated DocC documentation"
    git push -f "$REPO_URL" "$BRANCH"
    git checkout -
    echo "Deployment completed."
}

# Serve documentation locally
function serve_local() {
    echo "Serving website on http://localhost:$PORT/documentation/$PACKAGE_NAME"
    cd "$DOCS_DIR" || exit
    python3 -m http.server "$PORT"
}

# Menu
case "$CMD" in
    generate)
        generate_docs
        ;;
    deploy)
        generate_docs
        deploy
        ;;
    serve)
        serve_local
        ;;
    *)
        echo "Usage: $0 <PACKAGE_NAME> <DOCS_DIR> <BRANCH> <REPO_URL> <PORT> {generate|deploy|serve}"
        exit 1
        ;;
esac
