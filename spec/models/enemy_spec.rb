require 'rails_helper'

RSpec.describe Enemy, type: :model do
  it {should belong_to :item}
  it {should belong_to :location}
end
