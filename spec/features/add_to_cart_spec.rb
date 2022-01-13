require 'rails_helper'

RSpec.feature "Visitor adds a product to cart, and cart count increases by one", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Gear'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 88.99
      )
      
    end
  end

  scenario "They see all products" do
    visit root_path

    page.find(:button, 'Add').click
    expect(page).to have_text 'My Cart (1)'
  end

end