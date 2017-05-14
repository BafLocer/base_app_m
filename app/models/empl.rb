class Empl < ActiveRecord::Base
  belongs_to :depart

  has_many :emplproj

  validates :last_name, length: {maximum: 20}, presence: true
  validates :first_name, length: {maximum: 10}, presence: true
  validates :second_name, length: {maximum: 20}, presence: true
  validates :birthday, presence: true
  validates :post, presence: true
  validates :inn, length: {is: 7}, presence: true, numericality:
{only_integer: true}, uniqueness: true
  validates :passport, length: {is: 10},  presence: true, numericality:
{only_integer: true}, uniqueness: true
  accepts_nested_attributes_for :depart, allow_destroy: true
  # Если объект удалился, то используем замену dependent: :nullify



end
