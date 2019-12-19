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
    it 'I see the name of all of the snacks associated with that vending machine along with their price' do
      visit "/machines/#{@machine.id}"

      expect(page).to have_content("Snacks in This Machine:")
      expect(page).to have_content("Snack: #{@snack_1.name} | Price: $3.00")
      expect(page).to have_content("Snack: #{@snack_2.name} | Price: $2.50")
      expect(page).to have_content("Snack: #{@snack_3.name} | Price: $0.75")
      expect(page).to have_content("Snack: #{@snack_4.name} | Price: $1.75")
    end
  end
end
