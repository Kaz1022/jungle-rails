require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      category = Category.new(name: "New Category")
      product = Product.new(name: "Test Name", price: 8, quantity: 2, category: category)
      expect(category).to be_valid
      expect(product).to be_valid
    end

    it "is not valid without name attributes" do
      category = Category.new(name: "New Category")
      product = Product.new(name: nil, price_cents: 500, quantity: 2, category: category)
      expect(category).to be_valid
      expect(product).to_not be_valid
    end

    it "is not valid without price attributes" do
      category = Category.new(name: "New Category")
      product = Product.new(name: "Test Name", price_cents: nil, quantity: 2, category: category)
      expect(category).to be_valid
      expect(product).to_not be_valid
    end

    it "is not valid without quantity attributes" do
      category = Category.new(name: "New Category")
      product = Product.new(name: "Test Name", price_cents: 600, quantity: nil, category: category)
      expect(category).to be_valid
      expect(product).to_not be_valid
    end

    it "is not valid without quantity attributes" do
      category = Category.new(name: "New Category")
      product = Product.new(name: "Test Name", price_cents: 600, quantity: 10, category: nil)
      expect(category).to be_valid
      expect(product).to_not be_valid
    end
  end
end
