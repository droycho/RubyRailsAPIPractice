class Todo < ApplicationRecord
    #1. For TODO Association Test (test 2)
    has_many :items, dependent: :destroy

    #2. For TODO Validation Tests (tests 3,4)
    validates_presence_of :title, :created_by
end
