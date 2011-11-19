class Element < ActiveRecord::Base
  belongs_to :document
  has_many :state_options, :dependent => :destroy
  accepts_nested_attributes_for :state_options
end
