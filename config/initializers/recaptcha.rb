

Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPATCHA__PUBLIC_KEY']
  config.private_key = ENV['RECAPATCHA__PRIVATE_KEY']
end

