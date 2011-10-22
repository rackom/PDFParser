class AddPdffileToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :pdffile, :string
  end
end
