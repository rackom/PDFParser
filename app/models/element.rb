class Element < ActiveRecord::Base
  belongs_to :document
  has_many :state_options, :dependent => :destroy
end
