require 'pdf/toolkit'

class Document < ActiveRecord::Base
  mount_uploader :pdffile, PdffileUploader
  
  def self.dfields(doc)
    PDF::Toolkit.pdftk(doc.to_s,"dump_data_fields","output","-",:mode => 'r')
  end
end
