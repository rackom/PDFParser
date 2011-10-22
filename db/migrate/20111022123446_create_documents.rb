class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :hash
      t.text :description

      t.timestamps
    end
  end
end
