require 'rails_helper'

describe Character do
#   user = User.create(
#     email: 'test@example.com',
#    password: 'password123',
#    password_confirmation: 'password123'
#  )
  it { should belong_to :user }
    # it { should have_many :items }
end
