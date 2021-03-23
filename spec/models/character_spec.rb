require 'rails_helper'

RSpec.describe Character, type: :model do
  user = User.create(
    email: 'test@example.com', 
   password: 'password123',
   password_confirmation: 'password123'
 )
  it { should belong_to :user }
end
