require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the name of the snacks associated with that vending machine with the price and average price of all snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    burger = dons.snacks.create(name: "White Castle Burger", price: 3.5)
    candy = dons.snacks.create(name: "Pop Rocks", price: 1.5)
    chip = Snack.create(name: "Flaming Hot Cheetos", price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("White Castle Burger")
    expect(page).to have_content(3.5)
    expect(page).to have_content("Pop Rocks")
    expect(page).to have_content(1.5)
    expect(page).to_not have_content("Flaming Hot Cheetos")

    # expect(average_price).to eq("2.5")

  end
end
