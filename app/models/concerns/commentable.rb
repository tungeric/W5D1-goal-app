# file name must be the same as our module's name
module Commentable
  # this module becomes a concern thanks to this line
  extend ActiveSupport::Concern

  # code in this block will be run in class scope when the concern is included
  included do
    has_many :comments, as: :commentable
  end
end
