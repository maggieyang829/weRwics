class Blog < ActiveRecord::Base
    has_many :comments
    belongs_to :user
    validates :user_id, presence: true
    validates :content, presence: true
    validates :title, presence: true
end
