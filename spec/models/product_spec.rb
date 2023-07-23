require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully with all four fields set' do
      @category = Category.create(name: 'Electronics')
      @product = Product.new(
        name: 'Laptop',
        description: 'Powerful laptop with great specs',
        price_cents: 100000,
        quantity: 5,
        category: @category
      )
      expect(@product).to be_valid
    end

    it 'validates presence of name' do
      @category = Category.create(name: 'Electronics')
      @product = Product.new(
        description: 'Powerful laptop with great specs',
        price_cents: 100000,
        quantity: 5,
        category: @category
      )
      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates presence of price' do
      @category = Category.create(name: 'Electronics')
      @product = Product.new(
        name: 'Laptop',
        description: 'Powerful laptop with great specs',
        quantity: 5,
        category: @category
      )
      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates presence of quantity' do
      @category = Category.create(name: 'Electronics')
      @product = Product.new(
        name: 'Laptop',
        description: 'Powerful laptop with great specs',
        price_cents: 100000,
        category: @category
      )
      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates presence of category_id' do
      @product = Product.new(
        name: 'Laptop',
        description: 'Powerful laptop with great specs',
        price_cents: 100000,
        quantity: 5
      )
      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
