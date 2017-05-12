class Project < ActiveRecord::Base
  validates :p_name, presence: true
  validates :cost, presence: true
  validates :time_start, presence: true
  validates :time_finish, presence: true
  has_and_belongs_to_many :empls
  accepts_nested_attributes_for :empls, allow_destroy: true
end
