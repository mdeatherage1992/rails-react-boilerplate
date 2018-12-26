class CreateBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :batches do |t|
      t.string :name
      t.integer :int_size
      t.string :int_mea
      t.timestamps
    end
  end
end
