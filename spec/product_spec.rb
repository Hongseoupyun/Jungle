require 'rails_helper'
require 'spec_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before do 
      @category = Category.new
      @category.save!
    end
    it 'should have all fields and save successfully' do
      @product = @category.products.new( name:"test_name", price:30, quantity:30, category: @category)
      @product.save!
      @product.errors.full_messages
      expect(@product).to be_present
    end
    it 'should return an error when name is blank' do
      @product = @category.products.new( price:30, quantity:30, category: @category)
      @product.save
      @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'should have price' do
      @product = @category.products.new(name:"Francis", quantity:30, category: @category)
      @product.save
      @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'should have quantity' do
      @product = @category.products.new( name:"Charile", price:30, category: @category)
      @product.save
      @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should have category' do
      @product = @category.products.new( name:"test_name", price:30, quantity:30, category: @category)
      @product.save!
      @product.errors.full_messages
      expect(@product.category).to be_valid
    end
  end
end