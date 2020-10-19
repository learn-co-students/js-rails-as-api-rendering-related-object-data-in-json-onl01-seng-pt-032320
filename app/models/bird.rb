class Bird < ApplicationRecord
    has_many :sightings
    has_many :locataions, through: :sightings
end