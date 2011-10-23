class AddDocumentToElements < ActiveRecord::Migration
  def change
    add_column :elements, :document, :references
  end
end
