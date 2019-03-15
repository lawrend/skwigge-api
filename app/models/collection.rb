class Collection < ApplicationRecord
  has_many :collection_works
  has_many :works, through: :collection_works
end
