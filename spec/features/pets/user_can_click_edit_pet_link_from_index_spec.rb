require 'rails_helper'

describe 'as a visitor' do
  before :each do
    @otter_shelter = Shelter.create(name: "Get Otter Here", address: "789 River Street", city: "Lakewood", state: "CO", zip: 80213)
    @cat_shelter = Shelter.create(name: "The Cat's Pajamas", address: "123 Kitty Cat Street", city: "Denver", state: "CO", zip: 80211)
    @steve = @otter_shelter.pets.create(image: "https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4", name: 'Steve', approximate_age: 4, sex: 'Male')
    @karen = @cat_shelter.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s", name: 'Karen', approximate_age: 5, sex: 'Female')
  end
  describe 'when I am on the pets index page' do
    it 'shows a link to edit each pet' do
      visit '/pets'

      within "#pet-#{@steve.id}" do
        click_on 'Edit Pet Info'
      end

      expect(current_path).to eq("/pets/#{@steve.id}/edit")
      expect(page).to have_content('Steve')
    end
  end

  describe 'when I am on a shelter pets page' do
    it 'shows an edit link for each pet' do
      visit "/shelters/#{@otter_shelter.id}/pets"

      within "#pet-#{@steve.id}" do
        click_on 'Edit Pet Info'
      end

      expect(current_path).to eq("/pets/#{@steve.id}/edit")
      expect(page).to have_content('Steve')
    end
  end
end