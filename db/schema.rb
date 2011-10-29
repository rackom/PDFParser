# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111029141243) do

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.string   "checksum"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdffile"
  end

  create_table "elements", :force => true do |t|
    t.string   "FieldType"
    t.text     "FieldName"
    t.text     "FieldNameAlt"
    t.integer  "FieldFlags"
    t.string   "FieldJustification"
    t.integer  "FieldMaxLength"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elements", ["document_id"], :name => "index_elements_on_document_id"

  create_table "state_options", :force => true do |t|
    t.string   "value"
    t.integer  "element_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "state_options", ["element_id"], :name => "index_state_options_on_element_id"

end
