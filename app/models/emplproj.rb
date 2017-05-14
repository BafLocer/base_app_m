class Emplproj < ActiveRecord::Base
  belongs_to :empl
  belongs_to :project, inverse_of: :emplprojs

  validates :empl, presence: true
  validates :project, presence: true
end
