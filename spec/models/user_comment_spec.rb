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

require 'rails_helper'

RSpec.describe UserComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
