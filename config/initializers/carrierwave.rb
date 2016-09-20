CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = "fog/aws"

    config.fog_credentials = {
      :provider              => "AWS",
      :aws_access_key_id     => ENV["AWS_ACCESS_KEY_ID"],
      :aws_secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"],
      :region                => "us-east-1"
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }

    config.fog_directory  = ENV["S3_BUCKET_NAME"]
    config.fog_public     = true
    config.fog_attributes = { "Cache-Control" => "max-age=#{365.day.to_i}" }
  else
    config.storage = :file
  end
end
