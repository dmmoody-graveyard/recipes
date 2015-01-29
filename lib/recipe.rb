class Recipe < ActiveRecord::Base
  belongs_to_and_has_many(:categories)
  validates(:name, :presence => true)
end
