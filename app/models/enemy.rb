class Enemy < ApplicationRecord
  belongs_to :location
  has_one :item
end
