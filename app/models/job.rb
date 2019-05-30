class Job < ApplicationRecord
  validates :name, :points, presence: true
end
