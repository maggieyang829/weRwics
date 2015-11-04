class User < ActiveRecord::Base
    has_many :blogs
    has_many :albums
    validates :description, length: { maximum: 200 }, presence: true
end
