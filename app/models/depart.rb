class Depart < ActiveRecord::Base
  has_many :empls, dependent: :destroy, inverse_of: :depart
  validates :d_name, presence: true
end
