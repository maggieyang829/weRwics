class User < ActiveRecord::Base
    has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    has_many :blogs, dependent: :destroy
    has_many :photos, dependent: :destroy
    
    belongs_to :user_auth
    validates :name, presence: true
    validates :state, presence: true
    validates :city, presence: true
    validates :profession, presence: true
    validates :description, length: { maximum: 1000 }, presence: true
    
end
