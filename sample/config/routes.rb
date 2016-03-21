Rails.application.routes.draw do
  EnterprisePositionLevel::Routing.mount '/', :as => 'enterprise_position_level'
  mount PlayAuth::Engine => '/auth', :as => :auth
end
