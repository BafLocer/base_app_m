class Project < ActiveRecord::Base
  has_many :emplprojs, dependent: :destroy, inverse_of: :project
  accepts_nested_attributes_for :emplprojs, allow_destroy: true
  validates :p_name, presence: true
  validates :cost, presence: true
  validates :time_start, presence: true
  validates :time_finish, presence: true

end
