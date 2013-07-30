class Skill < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :context, presence: true

  has_many :proficiencies
  has_many :users, through: :proficiencies


  def user_with_proficiency(val)
    User.find(Proficiency.find_by_proficiency(val).user_id)
  end

end
