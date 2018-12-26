class CreateStrains < ActiveRecord::Migration[5.0]
  def change
    create_table :strains do |t|
      t.string :name
      t.integer :rating
      t.string :feeling
      t.timestamps
    end
  end
end
