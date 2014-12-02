Rails.application.routes.draw do
  resource :upload, only: [:show, :create]
end
