class Document < ActiveRecord::Base
  mount_uploader :pdffile, PdffileUploader
end
