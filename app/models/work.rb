class Work < ApplicationRecord
  belongs_to :user
  validates :hours, presence: true, numericality: {greater_than: 0,less_than: 24, message: " : Please input 0~24"}
  validates :learn, presence: true, length: {minimum:2, maximum:100, message: " : Please input something"}
  validates :health, presence: true
end