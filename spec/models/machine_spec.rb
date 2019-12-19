require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'instance methods' do
    describe 'avg_snack_price' do
      it 'returns average price among all associated snacks' do
        owner = Owner.create(name: 'Daniel Frampton')
        machine = owner.machines.create(location: 'Turing Mess Hall')
        snack_1 = Snack.create(name: 'Danritos', price: 300)
        snack_2 = Snack.create(name: 'ChocoDans', price: 250)
        snack_3 = Snack.create(name: 'DanBar', price: 75)
        snack_4 = Snack.create(name: 'D&Ds Candies', price: 175)
        MachineSnack.create(machine: machine, snack: snack_1, quantity: 1)
        MachineSnack.create(machine: machine, snack: snack_2, quantity: 1)
        MachineSnack.create(machine: machine, snack: snack_3, quantity: 1)
        MachineSnack.create(machine: machine, snack: snack_4, quantity: 1)

        expect(machine.avg_snack_price).to eq(200)
      end
    end

    describe 'snack_count' do
      it 'returns total number of associated snacks' do
        snack_1 = Snack.create(name: 'Danritos', price: 300)
        snack_2 = Snack.create(name: 'ChocoDans', price: 250)
        snack_3 = Snack.create(name: 'DanBar', price: 75)
        snack_4 = Snack.create(name: 'D&Ds Candies', price: 175)
        owner = Owner.create(name: 'Daniel Frampton')
        machine_1 = owner.machines.create(location: 'Turing Mess Hall')
        machine_2 = owner.machines.create(location: 'Guaranty Bank Lobby')
        MachineSnack.create(machine: machine_1, snack: snack_1, quantity: 1)
        MachineSnack.create(machine: machine_1, snack: snack_2, quantity: 1)
        MachineSnack.create(machine: machine_1, snack: snack_4, quantity: 1)
        MachineSnack.create(machine: machine_2, snack: snack_1, quantity: 1)
        MachineSnack.create(machine: machine_2, snack: snack_3, quantity: 1)

        expect(machine_1.snack_count).to eq(3)
        expect(machine_2.snack_count).to eq(2)
      end
    end
  end
end
