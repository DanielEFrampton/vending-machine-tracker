# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
