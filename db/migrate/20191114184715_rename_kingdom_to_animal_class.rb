class RenameKingdomToAnimalClass < ActiveRecord::Migration[5.2]
  def change
    rename_column :animals, :kingdom, :animal_class
  end
end
