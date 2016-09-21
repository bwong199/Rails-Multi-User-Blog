class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
  validates :content, presence: true
  has_many :comments, dependent: :destroy
  has_many :users_commented, through: :comments, source: :user
end
