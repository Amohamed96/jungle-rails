require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have a name' do
      @category = Category.new({ id: 1, name: 'Sports', created_at: Date.new, updated_at: Date.new })
      @product = Product.new({ category_id: 1, name: 'Basketball'})
      expect(@category.id).to be_present
      expect(@product.name).to be_present
    end
    
    it 'should have a price' do
      @category = Category.new({ id: 1, name: 'Sports', created_at: Date.new, updated_at: Date.new })
      @product = Product.new({ price: 50, name: 'Basketball'})
      expect(@category.name).to be_present
      expect(@product.price).to be_present
    end

    it 'should have a quantity' do
      @category = Category.new({ id: 1, name: 'Sports', created_at: Date.new, updated_at: Date.new })
      @product = Product.new({ quantity: 3, name: 'Basketball'})
      expect(@category.created_at).to be_present
      expect(@product.quantity).to be_present
    end

    it 'should have a category id' do
      @category = Category.new({ id: 1, name: 'Sports', created_at: Date.new, updated_at: Date.new })
      @product = Product.new({ category_id: 1, name: 'Basketball'})
      expect(@category.updated_at).to be_present
      expect(@product.category_id).to be_present
    end

    it 'should throw an error when a category property is nil' do
      @category = Category.new({ id: 1, name: 'Sports', created_at: Date.new, updated_at: Date.new })
      @product = Product.new({ category_id: 1, name: 'Basketball', quantity: 1, price: 50})
      expect{ expect(@product.name).to be_nil }.to raise_error(RSpec::Expectations::ExpectationNotMetError)
    end
  end
end