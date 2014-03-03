# Be sure to restart your server when you modify this file.

Provo::Application.config.session_store :cookie_store, key: '_provo_session'

Rails.application.config.try(:cookies_serializer, :hybrid)