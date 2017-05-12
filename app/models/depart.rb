class Depart < ActiveRecord::Base
  has_many :empls, dependent: :destroy, inverse_of: :depart
  validates :d_name, presence: true
  #nested_start
  #удаление отделов , у которых есть сотрудники
  # Для возможности добавлять сотрудников к ещё не существующим отделам
  # Если объект удалился, то используем замену dependent: :nullify
  before_destroy :my_nullify_before
  # Если объект не удалился, то восстанавливаем связи
  after_destroy :my_nullify_after

  private

  def my_nullify_before
    self.empls.each{ |t| t.update_attribute(:depart_id, nil) if t.persisted? } 
  end

  def my_nullify_after
    self.empls.each{ |t| t.update_attribute(:depart_id, self.id) if self.persisted? }
  end
end
