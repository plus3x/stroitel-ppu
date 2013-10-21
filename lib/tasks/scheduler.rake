namespace :deploy do
  desc 'Deploy the app'
  task :production do
    app = "stroru"
    remote = "git@heroku.com:#{app}.git"

    system "heroku maintenance:on --app #{app}"
    system "git push #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
    system "heroku run rake db:seed --app #{app}"
    system "heroku run rake sitemap:refresh --app #{app}"
    system "heroku maintenance:off --app #{app}"
  end
end