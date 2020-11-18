# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://anim8.us'

    resource '*',
      headers: :any,
      methods: [:get, :put, :patch]
  end

  if Rails.env.development?
    allow do
      origins /^(https?:\/\/)?localhost(:\d+)?$/

      resource '*',
        headers: :any,
        methods: [:get, :put, :patch]
    end
  end
end
