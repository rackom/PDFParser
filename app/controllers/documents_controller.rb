class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @documents.to_json(
        :only => [
          :id,
          :name,
          :checksum,
          :description
          ],
          :include => {
            :elements => {
              :only => [
                :FieldType,
                :FieldName,
                :FieldNameAlt,
                :FieldFlags,
                :FieldJustification,
                :FieldMaxLength
                ],
                :include => {
                  :state_options => {
                    :only => [
                      :value
                      ]
                  }
                }
            }
          }
        )
      }
      format.xml { render :xml => @documents.to_xml(
        :only => [
          :id,
          :name,
          :checksum,
          :description
          ],
          :include => {
            :elements => {
              :only => [
                :FieldType,
                :FieldName,
                :FieldNameAlt,
                :FieldFlags,
                :FieldJustification,
                :FieldMaxLength
                ],
                :include => {
                  :state_options => {
                    :only => [
                      :value
                      ]
                  }
                }
            }
          }
        )
      }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @document.to_json(
        :only => [
          :id,
          :name,
          :checksum,
          :description
          ],
          :include => {
            :elements => {
              :only => [
                :FieldType,
                :FieldName,
                :FieldNameAlt,
                :FieldFlags,
                :FieldJustification,
                :FieldMaxLength
                ],
                :include => {
                  :state_options => {
                    :only => [
                      :value
                      ]
                  }
                }
            }
          }
        )
      }
      format.xml { render :xml => @document.to_xml(
        :only => [
          :id,
          :name,
          :checksum,
          :description
          ],
          :include => {
            :elements => {
              :only => [
                :FieldType,
                :FieldName,
                :FieldNameAlt,
                :FieldFlags,
                :FieldJustification,
                :FieldMaxLength
                ],
                :include => {
                  :state_options => {
                    :only => [
                      :value
                      ]
                  }
                }
            }
          }
        )
      }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @document.to_json(
        :only => [
          :id,
          :name,
          :checksum,
          :description
          ],
          :include => {
            :elements => {
              :only => [
                :FieldType,
                :FieldName,
                :FieldNameAlt,
                :FieldFlags,
                :FieldJustification,
                :FieldMaxLength
                ],
                :include => {
                  :state_options => {
                    :only => [
                      :value
                      ]
                  }
                }
            }
          }
        )
      }
      format.xml { render :xml => @document.to_xml(
        :only => [
          :id,
          :name,
          :checksum,
          :description
          ],
          :include => {
            :elements => {
              :only => [
                :FieldType,
                :FieldName,
                :FieldNameAlt,
                :FieldFlags,
                :FieldJustification,
                :FieldMaxLength
                ],
                :include => {
                  :state_options => {
                    :only => [
                      :value
                      ]
                  }
                }
            }
          }
        )
      }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, :notice => 'Document was successfully created.' }
        format.json { render :json => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.json { render :json => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to @document, :notice => 'Document was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :ok }
    end
  end
  
  # Zisti ci je dokument uz v DB
  # ak je dokument v DB vrati jeho policka
  # ak dokument nie je v DB vrati null
  def document_check
    # ziskame dokument
    document = Document.find_by_checksum(params[:md5_checksum])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => document.to_json(
        :only => [
          :id,
          :name,
          :checksum,
          :description
          ],
          :include => {
            :elements => {
              :only => [
                :FieldType,
                :FieldName,
                :FieldNameAlt,
                :FieldFlags,
                :FieldJustification,
                :FieldMaxLength
                ],
                :include => {
                  :state_options => {
                    :only => [
                      :value
                      ]
                  }
                }
            }
          }
        )
      }
      format.xml { render :xml => document.to_xml(
        :only => [
          :id,
          :name,
          :checksum,
          :description
          ],
          :include => {
            :elements => {
              :only => [
                :FieldType,
                :FieldName,
                :FieldNameAlt,
                :FieldFlags,
                :FieldJustification,
                :FieldMaxLength
                ],
                :include => {
                  :state_options => {
                    :only => [
                      :value
                      ]
                  }
                }
            }
          }
        )
      }
    end
  end
end
