Rails.application.routes.draw do
  scope module: :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :cams, only: %i[index]
    end
  end
end
