class AddNotesToBatches < ActiveRecord::Migration[5.0]
  def change
    add_column :batches, :notes, :string, array: true, default: []
  end
end
