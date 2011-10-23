class Document < ActiveRecord::Base
  mount_uploader :pdffile, PdffileUploader
  after_save :dfields
  
  def dfields
    if not self.description?
      # ziskat svoj zaznam
      doc = self.pdffile
    
      # ziskat absolutnu cestu ku pdf suboru
      url = %x[pwd] + "/public" + doc.url
    
      # odstranit \n ktore vracia pwd
      url.gsub!(/\n/,'')

      # ziskat datove polia
      data_fields = %x[pdftk #{url} dump_data_fields]
    
      # nahradit newline za <br>
      data_fields.gsub!(/\n/,'<br>')
    
      # aby to bolo v pohode s html
      data_fields.html_safe
      
      #test
      #data_fields.gsub!('---','')
      #main_array = data_fields.split("\t")
      #main_array.each {|element| element = element.split("\n") }
      #test
    
      #self.description = main_array
      self.description = data_fields
      self.save
    end
  end
end
