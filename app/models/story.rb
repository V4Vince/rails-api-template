class Story < ActiveRecord::Base
  belongs_to :user, inverse_of: :stories
  validates :text, :user, presence: true
end