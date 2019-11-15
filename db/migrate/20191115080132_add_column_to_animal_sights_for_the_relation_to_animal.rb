class AddColumnToAnimalSightsForTheRelationToAnimal < ActiveRecord::Migration[5.2]
  def change
    add_column :animal_sightings, :animal_id, :integer
  end
end
