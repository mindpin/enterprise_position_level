Rails.application.routes.draw do
  mount EnterprisePositionLevel::Engine => '/', :as => 'enterprise_position_level'
  mount PlayAuth::Engine => '/auth', :as => :auth
end
