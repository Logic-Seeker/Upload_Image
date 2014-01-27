CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_SECRET'],
      :aws_secret_access_key => ENV['S3_KEY'] 
    }
    config.fog_directory    = "Demophoto"
  elsif Rails.env.test? or Rails.env.cucumber?
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = true
    end
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end
