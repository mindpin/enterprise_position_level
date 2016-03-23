module EnterprisePositionLevel
  class Post
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,   type: String
    field :number, type: String

    validates :name, presence: true, uniqueness: true
    validates :number, presence: true, uniqueness: true
  end
end
