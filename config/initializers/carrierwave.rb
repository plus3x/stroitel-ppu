CarrierWave.configure do |config|
  config.root        = Rails.root.join('tmp')
  config.cache_dir   = 'uploads'
  config.storage     = :fog
  config.permissions = 0666
  config.fog_credentials = {
    provider:              ENV['FOG_PROVIDER'],
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                ENV['AWS_REGION']
  }
  config.fog_directory  = ENV['FOG_DIRECTORY']
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day}" }
end if Rails.env.production?
