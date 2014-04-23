# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :look_into_spec_folder do
  ENV['SOURCE_ANNOTATION_DIRECTORIES'] = 'spec'
end
Rake::Task['notes'].enhance [:look_into_spec_folder]
