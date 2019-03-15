class Work < ApplicationRecord
  has_many :collection_works
  has_many :collections, through: :collection_works
end
