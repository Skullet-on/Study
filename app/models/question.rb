class Question < ActiveRecord::Base
  validates :body, presence: true
  belongs_to  :test
  has_many    :answers
end
