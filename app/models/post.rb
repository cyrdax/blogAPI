class Post < ApplicationRecord

  belongs_to :user
  has_many :links, dependent: :destroy

end
