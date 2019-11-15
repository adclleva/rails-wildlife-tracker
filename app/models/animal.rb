class Animal < ApplicationRecord
    # validates :common_name, uniqueness: true
    validates :common_name, presence: true
    has_many :animal_sightings
end
