class Post < ActiveRecord::Base
  belongs_to :users
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
end
