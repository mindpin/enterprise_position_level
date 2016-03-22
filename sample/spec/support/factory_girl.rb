require 'database_cleaner'
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      # TODO DatabaseCleaner 1.5.1 不兼容 mongoid 5.1.1，先妥协手动删除数据
      User.destroy_all
      EnterprisePositionLevel::UserPositionLevel.destroy_all
      EnterprisePositionLevel::Post.destroy_all
      EnterprisePositionLevel::Level.destroy_all
      ###
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end


  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end
end
