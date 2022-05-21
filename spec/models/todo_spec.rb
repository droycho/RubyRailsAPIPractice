require 'rails_helper'

RSpec.describe Todo, type: :model do
  #1. Association Test: ensure TODO model has a one-to-many relationship with ITEM
  it{should have_many(:items).dependent(:destroy)}

  #2. Validation Tests: ensure columns TITLE and CREATED_BY are present before save
  it{should validate_presence_of(:title)}
  it{should validate_presence_of(:created_by)}
end
