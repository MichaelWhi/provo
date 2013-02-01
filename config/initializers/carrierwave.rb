require 'carrierwave/orm/activerecord'

if Rails.env.production?
  # https://devcenter.heroku.com/articles/bucket#using-bucket-from-ruby
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],                        # required
      :aws_secret_access_key  => ENV["AWS_SECRET_KEY"]                        # required
    }
    config.fog_directory  = ENV["AWS_BUCKET"]                     # required
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end