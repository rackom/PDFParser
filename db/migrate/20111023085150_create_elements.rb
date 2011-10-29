class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :FieldType
      t.text :FieldName
      t.text :FieldNameAlt
      t.integer :FieldFlags
      t.string :FieldJustification
      t.integer :FieldMaxLength
      t.references :document

      t.timestamps
    end
    add_index :elements, :document_id
  end
end
