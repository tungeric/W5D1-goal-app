# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#

class UserComment < ApplicationRecord
  validates :body, :user_id, :author_id, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
