Rails.application.routes.draw do
  jsonapi_resources :shows
  jsonapi_resources :jobs
end
