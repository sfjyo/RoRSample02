class Product < ApplicationRecord
  has_many :sales
  has_many :shops, through: :sales
end
