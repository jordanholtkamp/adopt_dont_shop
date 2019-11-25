require 'rails_helper'

describe 'as a visitor', type: :feature do
  describe 'when I am on the pet show page' do
    before(:each) do
      @otter_shelter = Shelter.create(name: "Get Otter Here", address: "789 River Street", city: "Lakewood", state: "CO", zip: 80213)
      @cat_shelter = Shelter.create(name: "The Cat's Pajamas", address: "123 Kitty Cat Street", city: "Denver", state: "CO", zip: 80211)
      @steve = @otter_shelter.pets.create(image: "https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4", name: 'Steve', approximate_age: 4, sex: 'Male')
      @karen = @cat_shelter.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s", name: 'Karen', approximate_age: 5, sex: 'Female')
    end

    it 'can update the pet info' do

      visit "/pets/#{@karen.id}"

      click_on ('Edit Pet')

      expect(current_path).to eq("/pets/#{@karen.id}/edit")

      fill_in 'name', with: 'Sharon'
      fill_in 'image', with: 'https://www.petmd.com/sites/default/files/Senior-Cat-Care-2070625.jpg'
      fill_in 'description', with: 'I am one cuddly kitty'
      fill_in 'approximate_age', with: 3

      click_on 'Update Pet'

      expect(current_path).to eq("/pets/#{@karen.id}")
      expect(page).to have_content('Sharon')
      expect(page). to have_no_content('Karen')

      expect(page).to have_content(3)
      expect(page).to have_no_content(5)

      expect(page).to have_content('I am one cuddly kitty')
    end
  end
end