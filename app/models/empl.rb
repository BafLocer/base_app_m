class Empl < ActiveRecord::Base
  belongs_to :depart

  has_many :emplprojs, inverse_of: :empl
  

  validates :last_name, length: {maximum: 20}, presence: true
  validates :first_name, length: {maximum: 10}, presence: true
  validates :second_name, length: {maximum: 20}, presence: true
  validates :birthday, presence: true
  validates :post, presence: true
  validates :inn, length: {is: 7}, presence: true, numericality:
{only_integer: true}, uniqueness: true
  validates :passport, length: {is: 10},  presence: true, numericality:
{only_integer: true}, uniqueness: true
  validates :depart, presence: true
  accepts_nested_attributes_for :depart, reject_if: :all_blank


  def self.search(params)
    result = Empl.eager_load(:depart, :emplprojs, emplprojs: :project).references(:depart)
    if params['project_id'].present?
      result = result.where("emplprojs.project_id = ?", params['project_id'])
    end
    if params['depart_id'].present?
      result = result.where(depart_id: params['depart_id'])
    end
    if params['last_name'].present?
      result = result.where(last_name: params['last_name'])
    end
    if params['first_name'].present?
      result = result.where(first_name: params['first_name'])
    end
    if params['second_name'].present?
      result = result.where(second_name: params['second_name'])
    end
    if params['birthday'].present?
      result = result.where(birthday: params['birthday'])
    end
    if params['post'].present?
      result = result.where(post: params['post'])
    end
    if params['inn'].present?
      result = result.where(inn: params['inn'])
    end
     if params['passport'].present?
      result = result.where(passport: params['passport'])
    end
     result.all
  end
  
  



end
