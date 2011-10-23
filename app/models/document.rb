class Document < ActiveRecord::Base
  has_many :elements
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
      #data_fields.gsub!(/\n/,'<br>')
    
      # aby to bolo v pohode s html
      #data_fields.html_safe
      
      #test
      main_array = data_fields.split("\n")
      
      @tmp_array = []
      
      main_array.each do |e|
        if not e.include? "---"
          #ak to nie je oddelovac pridam element do pola
          @tmp_array.push e
        else
          #ak to je oddelovac
          if @tmp_array and not @tmp_array.empty?
            # ak nie je pole prazdne vytvorime si novy prvok
            new_element = Element.new
            
            @tmp_array.each do |item|
              # ak je to typ polozky
              if item.include? "FieldType"
                logger.debug item.split(":")[1..-1]
                new_element.FieldType = item.split(":")[1..-1]
              end
              
              #ak je to nazov polozky
              if item.include? "FieldName"
                new_element.FieldName = item.split(":")[1..-1]
              end
              
              #ak je to popis polozky
              if item.include? "FieldNameAlt"
                new_element.FieldNameAlt = item.split(":")[1..-1]
              end
              
              # ak je to flag polozky
              if item.include? "FieldFlags"
                new_element.FieldFlags = item.split(":")[1..-1]
              end
              
              # ak je to zarovnanie
              if item.include? "FieldJustification"
                new_element.FieldJustification = item.split(":")[1..-1]
              end
              
              # ak je to maximalna dlzka
              if item.include? "FieldMaxLength"
                new_element.FieldMaxLength = item.split(":")[1..-1]
              end
            end
            
            new_element.document_id = self.id
            new_element.save
            @tmp_array.clear
          end
        end
      end
      #test

      #self.description = main_array
      self.description = data_fields
      self.save
    end
  end
end
