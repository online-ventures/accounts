class Show < ApplicationRecord
  validates :name, :occurred_at, presence: true
end
