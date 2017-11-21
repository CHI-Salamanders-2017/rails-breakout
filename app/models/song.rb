class Song < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, :artist, presence: true
end
