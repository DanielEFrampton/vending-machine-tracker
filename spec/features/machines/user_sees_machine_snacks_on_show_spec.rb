require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @owner = Owner.create(name: 'Daniel Frampton')
    @machine = @owner.machines.create(location: 'Turing Mess Hall')
    @snack_1 = @machine.snacks.create(name: 'Danritos', price: 3)
    @snack_2 = @machine.snacks.create(name: 'ChocoDans', price: 2)
    @snack_3 = @machine.snacks.create(name: 'DanBar', price: 5)
    @snack_4 = @machine.snacks.create(name: 'D&Ds Candies', price: 8)
  end

  describe 'When I visit a vending machine show page' do
    it 'I see the name of all of the snacks associated with that vending machine along with their price' do
      visit "/machines/#{@machine.id}"

      expect(page).to have_content("Snacks in This Machine:")
      expect(page).to have_content("Snack: #{@snack_1.name} | Price: #{@snack_1.price}")
      expect(page).to have_content("Snack: #{@snack_2.name} | Price: #{@snack_2.price}")
      expect(page).to have_content("Snack: #{@snack_3.name} | Price: #{@snack_3.price}")
      expect(page).to have_content("Snack: #{@snack_4.name} | Price: #{@snack_4.price}")
    end
  end
end
