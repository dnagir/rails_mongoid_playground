class Post
  include Mongoid::Document
  field :title, :type => String
  field :body, :type => String
  embeds_many :comments
end
