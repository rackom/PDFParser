require "digest"

class Document < ActiveRecord::Base
  has_many :elements, :dependent => :destroy
  mount_uploader :pdffile, PdffileUploader
  after_create :dfields # zatial iba after create
  after_create :digest_file # po vytvoreni zmen digest suboru v DB
  validates_presence_of :pdffile
  
  def digest_file
    url = %x[pwd] + "/public" + self.pdffile.url
    url.gsub!(/\n/,'')
    self.checksum = Digest::MD5.hexdigest(File.read(url))
    self.save
  end
  
  def dfields
     # ziskat svoj zaznam
    doc = self.pdffile
  
    # ziskat absolutnu cestu ku pdf suboru
    url = %x[pwd] + "/public" + doc.url
  
    # odstranit \n ktore vracia pwd
    url.gsub!(/\n/,'')

    # ziskat datove polia
    data_fields = %x[pdftk #{url} dump_data_fields]
    
    # ziskanie pola objektov
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
              new_element.FieldType = item.split(":")[1..-1].map { |i| i.to_s }.join().squeeze(" ").strip
            end
            
            #ak je to nazov polozky
            if item.include? "FieldName"
              new_element.FieldName = item.split(":")[1..-1].map { |i| i.to_s }.join().squeeze(" ").strip
            end
            
            #ak je to popis polozky
            if item.include? "FieldNameAlt"
              new_element.FieldNameAlt = item.split(":")[1..-1].map { |i| i.to_s }.join().squeeze(" ").strip
            end
            
            # ak je to flag polozky
            if item.include? "FieldFlags"
              new_element.FieldFlags = item.split(":")[1..-1].map { |i| i.to_s }.join().squeeze(" ").strip
            end
            
            # ak je to zarovnanie
            if item.include? "FieldJustification"
              new_element.FieldJustification = item.split(":")[1..-1].map { |i| i.to_s }.join().squeeze(" ").strip
            end
            
            # ak je to maximalna dlzka
            if item.include? "FieldMaxLength"
              max_len = item.split(":")[1..-1].map { |i| i.to_s }.join().squeeze(" ").strip
              
              if max_len.include? "65536"
                max_len = 65535
              end
              
              new_element.FieldMaxLength = max_len
            end
          end
          
          new_element.document_id = self.id
          new_element.save
          @tmp_array.clear
        end
      end
    end
  end
end
