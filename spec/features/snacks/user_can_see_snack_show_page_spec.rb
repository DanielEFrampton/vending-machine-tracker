require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a snack show page' do
    before(:each) do
      @snack_1 = Snack.create(name: 'Danritos', price: 300)
      @snack_2 = Snack.create(name: 'ChocoDans', price: 250)
      @snack_3 = Snack.create(name: 'DanBar', price: 75)
      @snack_4 = Snack.create(name: 'D&Ds Candies', price: 175)
      @owner = Owner.create(name: 'Daniel Frampton')
      @machine_1 = @owner.machines.create(location: 'Turing Mess Hall')
      @machine_2 = @owner.machines.create(location: 'Guaranty Bank Lobby')
      MachineSnack.create(machine: @machine_1, snack: @snack_1, quantity: 1)
      MachineSnack.create(machine: @machine_1, snack: @snack_2, quantity: 1)
      MachineSnack.create(machine: @machine_1, snack: @snack_4, quantity: 1)
      MachineSnack.create(machine: @machine_2, snack: @snack_1, quantity: 1)
      MachineSnack.create(machine: @machine_2, snack: @snack_3, quantity: 1)
      visit "/snacks/#{@snack_1.id}"
    end

    it 'I see the name of that snack' do
      expect(page).to have_content(@snack_1.name)
    end

    it 'I see the price for that snack' do
      expect(page).to have_content("$3.00")
    end

    it 'I see a list of locations with vending machines that carry that snack' do
      expect(page).to have_content('Locations')
      expect(page).to have_content(@machine_1.location)
      expect(page).to have_content(@machine_2.location)
    end

    it 'I see the average price for snacks in those vending machines' do
      within "#machine-#{@machine_1.id}" do
        expect(page).to have_content('average price of $2.42')
      end

      within "#machine-#{@machine_2.id}" do
        expect(page).to have_content('average price of $1.88')
      end
    end

    it 'I see a count of the different kinds of items in that vending machine' do
      within "#machine-#{@machine_1.id}" do
        expect(page).to have_content('3 kinds of snacks')
      end

      within "#machine-#{@machine_2.id}" do
        expect(page).to have_content('2 kinds of snacks')
      end
    end
  end
end
