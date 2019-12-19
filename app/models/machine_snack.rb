class MachineSnack < ApplicationRecord
  validates_presence_of :quantity
  
  belongs_to :machine
  belongs_to :snack
end
