namespace :deploy do
  APP = 'stroru'
  
  desc 'Deploy the application production to Heroku'
  task :heroku do
    heroku_repo = "git@heroku.com:#{APP}.git"
    sh "heroku maintenance:on --app #{APP}"
    sh "git push #{heroku_repo} master"
    sh "heroku run rake db:migrate --app #{APP}"
    sh "heroku run rake sitemap:refresh --app #{APP}"
    sh "heroku maintenance:off --app #{APP}"
  end
end