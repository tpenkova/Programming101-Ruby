class Lecture < ActiveRecord::Base
  has_many :tasks
  #has_many :solutions, through: :tasks
end
