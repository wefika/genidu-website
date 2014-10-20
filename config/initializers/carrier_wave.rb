CarrierWave.configure do |config|
  config.asset_host = ENV['ASSET_HOST'] if ENV['ASSET_HOST'].present?

  if Rails.env.test? or Rails.env.development?
    config.storage = :file
    config.enable_processing = false if Rails.env.test?

  else # Production
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']
    }
    config.fog_directory  = ENV['FOG_DIRECTORY']
  end

end
