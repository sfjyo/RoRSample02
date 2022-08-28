class Shop < ApplicationRecord
  has_many :sales
  has_many :products, through: :sales

  accepts_nested_attributes_for :sales, allow_destroy: true
end
