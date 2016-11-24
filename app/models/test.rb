class Test < ActiveRecord::Base
  validates :subject, presence: true
  validates :part, presence: true

  has_many :questions
  
end
