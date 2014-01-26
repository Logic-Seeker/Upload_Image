CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAIAGTVHE3GGLUYXQQ',
      :aws_secret_access_key => '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'
    }
    config.fog_directory    = "Demophoto"
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end
