class CreateStateOptions < ActiveRecord::Migration
  def change
    create_table :state_options do |t|
      t.string :value
      t.references :element

      t.timestamps
    end
    add_index :state_options, :element_id
  end
end
