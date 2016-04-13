Rails.application.routes.draw do
  mount PlayAuth::Engine => '/auth', :as => :auth

  root to: "home#index"
end
