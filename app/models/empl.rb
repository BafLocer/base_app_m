class Empl < ActiveRecord::Base
  belongs_to :depart
  

  
  validates :last_name, length: {maximum: 20}, presence: true
  validates :first_name, length: {maximum: 10}, presence: true
  validates :second_name, length: {maximum: 20}, presence: true
  validates :birthday, presence: true
  validates :post, presence: true
  validates :inn, length: {is: 7}, presence: true, numericality:
{only_integer: true}, uniqueness: true
  validates :passport, length: {is: 10},  presence: true, numericality:
{only_integer: true}, uniqueness: true
  has_and_belongs_to_many :projects, dependent: :destroy, inverse_of: :empl
  accepts_nested_attributes_for :depart, allow_destroy: true
  # Если объект удалился, то используем замену dependent: :nullify
  before_destroy :my_nullify_before
  # Если объект не удалился, то восстанавливаем связи
  after_destroy :my_nullify_after

  private

  def my_nullify_before
    self.projects.each{ |t| t.update_attribute(:empl_id, nil) if t.persisted? } 
  end

  def my_nullify_after
    self.projects.each{ |t| t.update_attribute(:empl_id, self.id) if self.persisted? }
  end
  
  
end
