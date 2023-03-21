class Location < ApplicationRecord
  belongs_to :sub_category
  has_many_attached :images
end
