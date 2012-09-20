

begin
  secret_keys = YAML.load_file("/etc/motomem/secret_keys.yml")
rescue
  secret_keys = YAML.load_file("#{::Rails.root.to_s}/config/secret_keys.yml")
end


OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, secret_keys['facebook_app_id'], secret_keys['facebook_app_secret'], {:scope => "email, publish_actions", :client_options => {:ssl => {:ca_file => "/usr/lib/ssl/certs/ca-certificates.crt"}}}
end