require 'rails_helper'

RSpec.describe 'When a user visits a snacks show page', type: :feature do
  scenario 'they see the name fo that snack and all relating information' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    rons = owner.machines.create(location: "Ron's Mixed Snacks")

    burger = dons.snacks.create(name: "White Castle Burger", price: 3.5)
    burger = rons.snacks.create(name: "White Castle Burger", price: 3.5)
    candy = dons.snacks.create(name: "Pop Rocks", price: 1.5)
    chip = Snack.create(name: "Flaming Hot Cheetos", price: 2.50)

    visit snack_path(burger)

    expect(page).to have_content(burger.name)
    expect(page).to have_content(burger.price)
    expect(page).to have_content()

  end
end
