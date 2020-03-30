activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets


# ------ Uncomment and adapt if you want to use i18n ------
# activate :i18n, mount_at_root: :fr, langs: [:fr, :en]

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
activate :i18n,
   :mount_at_root => 'fr',
   :path => "/:locale/"

configure :build do
  activate :minify_css
  # ------ We commented this command as it prevented us to deploy our Middleman project on GitHub Pages ------
  # activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end


helpers do
  def local_img
    if I18n.locale == :fr
      return :img_fr
    else
      return :img_en
    end
  end

  def current_local
    if I18n.locale == :fr
      return 'fr'
    else
      return 'en'
    end
  end
end


activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
  deploy.branch = "master"
  deploy.remote = "git@github.com:s123567/screen_sav.github.io.git"
end
