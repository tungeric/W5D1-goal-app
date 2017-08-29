# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#

class Goal < ApplicationRecord
  validates :author, :title, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :goal_comments,
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: :GoalComment

end
