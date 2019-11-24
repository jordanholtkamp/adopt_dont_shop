require 'rails_helper'

describe 'as a visitor', type: :feature do
  describe 'when I am on a shelter pets page' do
      @otter_shelter = Shelter.create(name: "Get Otter Here", address: "789 River Street", city: "Lakewood", state: "CO", zip: 80213)
      @cat_shelter = Shelter.create(name: "The Cat's Pajamas", address: "123 Kitty Cat Street", city: "Denver", state: "CO", zip: 80211)
      @steve = @otter_shelter.pets.create(image: "https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4", name: 'Steve', approximate_age: 4, sex: 'Male')
      @karen = @cat_shelter.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s", name: 'Karen', approximate_age: 5, sex: 'Female')

      visit "shelters/#{@otter_shelter.id}/pets"

      it 'can see all of the pets for that shelter' do

      expect(page).to have_content(@steve.name)
      expect(page).to have_content(@steve.approximate_age)
      expect(page).to have_content(@steve.sex)
      expect(page).to have_css("img[src*= 'https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4']")

      expect(page).to have_no_content(@karen.name)
      expect(page).to have_no_content(@karen.approximate_age)
      expect(page).to have_no_content(@karen.sex)
      expect(page).to have_no_css("img[src*= 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s']")
    end

    it 'has a link to add a new pet' do

      click('Add Pet')

      expect(current_path).to eq("/shelters/#{@otter_shelter.id}/pets/new")
      expect(page).to have_feild(:image)
      expect(page).to have_feild(:name)
      expect(page).to have_feild(:description)
      expect(page).to have_feild(:approximate_age)
      expect(page).to have_feild(:sex)
    end
  end
end

# User Story 10, Shelter Pet Creation

# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
