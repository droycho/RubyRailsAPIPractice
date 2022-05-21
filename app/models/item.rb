class Item < ApplicationRecord
  #1. For Association Test (test 0)
  belongs_to :todo

  #2. For Validation Test (test 1)
  validates_presence_of :name
end
