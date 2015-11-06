class User < ActiveRecord::Base
    has_many :blogs, dependent: :destroy
    has_many :albums

    validates :name, presence: true
    validates :email, presence: true
    validates :state, presence: true
    validates :city, presence: true
    validates :profession, presence: true
    validates :description, length: { maximum: 1000 }, presence: true
end
