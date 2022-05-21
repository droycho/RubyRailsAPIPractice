require 'rails_helper'

RSpec.describe Item, type: :model do
  #1. Association Test: ensure an ITEM record belongs to a single TODO record
  it{should belong_to(:todo)}

  #2. Validation Test: ensure column NAME is present before saving
  it{should validate_presence_of(:name)}
end
