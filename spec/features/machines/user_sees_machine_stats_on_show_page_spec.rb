require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @owner = Owner.create(name: 'Daniel Frampton')
    @machine = @owner.machines.create(location: 'Turing Mess Hall')
    @snack_1 = Snack.create(name: 'Danritos', price: 300)
    @snack_2 = Snack.create(name: 'ChocoDans', price: 250)
    @snack_3 = Snack.create(name: 'DanBar', price: 75)
    @snack_4 = Snack.create(name: 'D&Ds Candies', price: 175)
    MachineSnack.create(machine: @machine, snack: @snack_1, quantity: 1)
    MachineSnack.create(machine: @machine, snack: @snack_2, quantity: 1)
    MachineSnack.create(machine: @machine, snack: @snack_3, quantity: 1)
    MachineSnack.create(machine: @machine, snack: @snack_4, quantity: 1)
  end

  describe 'When I visit a vending machine show page' do
    it 'I also see an average price for all of the snacks in that machine' do
      visit "/machines/#{@machine.id}"

      expect(page).to have_content("Average Price: $2.00")
    end
  end
end
