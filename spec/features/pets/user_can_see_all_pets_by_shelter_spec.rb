require 'rails_helper'

describe 'as a visitor', type: :feature do
  describe 'when I am on a shelter pets page' do
    it 'can see all of the pets for that shelter' do
      otter_shelter = Shelter.create(name: "Get Otter Here", address: "789 River Street", city: "Lakewood", state: "CO", zip: 80213)
      cat_shelter = Shelter.create(name: "The Cat's Pajamas", address: "123 Kitty Cat Street", city: "Denver", state: "CO", zip: 80211)
      steve = otter_shelter.pets.create(image: "https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4", name: 'Steve', approximate_age: 4, sex: 'Male')
      karen = cat_shelter.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s", name: 'Karen', approximate_age: 5, sex: 'Female')

      visit "sheltes/#{otter_shelter.id}/pets"

      expect(page).to have_content(steve.name)
      expect(page).to have_content(steve.approximate_age)
      expect(page).to have(steve.sex)
      expect(page).to have_css("img[src*= 'https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4']")

      expect(page).to have_no_content(karen.name)
      expect(page).to have_no_content(karen.approximate_age)
      expect(page).to have_no_content(karen.sex)
      expect(page).to have_no_css("img[src*= 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s']")
    end
  end
end


# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex