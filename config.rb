# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax
ready do
  require './lib/multilang.rb'
end

activate :sprockets

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

activate :livereload, no_swf: true, host: '0.0.0.0', port: '35729', js_host: '127.0.0.1'

# Build Configuration
configure :build do
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567

# Redirects old API versions to the latest one
redirect "v1/index.html", to: "/sync/v8/"
redirect "v2/index.html", to: "/sync/v8/"
redirect "v3/index.html", to: "/sync/v8/"
redirect "v4/index.html", to: "/sync/v8/"
redirect "v5/index.html", to: "/sync/v8/"
redirect "v6/index.html", to: "/sync/v8/"
redirect "v7/index.html", to: "/sync/v8/"

redirect "sync/index.html", to: "/sync/v8/"
redirect "rest/index.html", to: "/rest/v8/"
redirect "beta/index.html", to: "/rest/v8/"

redirect "index.html", to: "/sync/v8/"
