class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :proficiencies
  has_many :skills, through: :proficiencies

  def proficiency_for(skill)
    self.proficiencies.find_by_skill_id(skill.id).proficiency
  end

  def set_proficiency_for(skill, val)
    skill = self.proficiencies.find_by_skill_id(skill.id)
    skill.proficiency = val
    skill.save
  end
end
