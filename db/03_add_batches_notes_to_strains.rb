class AddBatchesNotesToStrains < ActiveRecord::Migration[5.0]
  def change
    add_column :strains, :batches, :string, array: true, default: []
    add_column :strains, :notes, :string, array: true, default: []
  end
end
