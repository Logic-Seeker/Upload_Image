CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV["AWS_ACCESS_KEY_ID"],
      :aws_secret_access_key => ENV["AWS_ACCESS_KEY"]
    }
    config.fog_directory    = ENV["AWS_BUCKET"]
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end
