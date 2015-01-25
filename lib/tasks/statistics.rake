task :stats do
  require 'rails/code_statistics'

  ADDITIONAL_STATS_DIRECTORIES = [
    %w(Controller\ specs  spec/controllers),
    %w(Model\ specs       spec/models),
    %w(Helper\ specs      spec/helpers),
    %w(Job\ specs         spec/jobs),
    %w(Requests\ specs    spec/requests),
    %w(Features\ specs    spec/features),
    %w(Cucumber\ features features)
  ].select { |name, dir| File.directory?(Rails.root.join(dir)) }

  ADDITIONAL_TEST_TYPES = ADDITIONAL_STATS_DIRECTORIES.map(&:first)

  STATS_DIRECTORIES.concat ADDITIONAL_STATS_DIRECTORIES
  CodeStatistics::TEST_TYPES.concat ADDITIONAL_TEST_TYPES
end
