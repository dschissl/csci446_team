require 'test_helper'

class PetTest < ActiveSupport::TestCase
	fixtures :pets

	test "pet attributes must not be empty" do pet = Pet.new
		assert pet.invalid?
		assert pet.errors[:name].any?
		assert pet.errors[:age].any?
		assert pet.errors[:pet_type].any?
		assert pet.errors[:description].any?
		assert pet.errors[:image_url].any?
	end

	test "pet's age must be 0 or positive" do
		pet = Pet.new(name: pets(:new).name, age: pets(:new).age, pet_type: pets(:new).pet_type, description: pets(:new).description, image_url: pets(:new).image_url)
		pet.age = -1
		assert pet.invalid?
		assert_equal "must be greater than or equal to 0",
		pet.errors[:age].join('; ')
		pet.age = 0
		assert pet.valid?
		pet.age = 1
		assert pet.valid?
	end

	def new_pet(image_url) 
		Pet.new(name: pets(:new).name, age: pets(:new).age, pet_type: pets(:new).pet_type, description: pets(:new).description, image_url: image_url)
	end

	test "image url" do
		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
		bad = %w{ fred.doc fred.gif/more fred.gif.more }
		ok.each do |name|
			assert new_pet(name).valid?, "#{name} shouldn't be invalid"
		end
		bad.each do |name|
			assert new_pet(name).invalid?, "#{name} shouldn't be valid"
		end 
	end
end
