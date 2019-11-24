require 'rails_helper'

describe 'as a visitor' do
  before :each do
    @otter_shelter = Shelter.create(name: "Get Otter Here", address: "789 River Street", city: "Lakewood", state: "CO", zip: 80213)
    @cat_shelter = Shelter.create(name: "The Cat's Pajamas", address: "123 Kitty Cat Street", city: "Denver", state: "CO", zip: 80211)
    @steve = @otter_shelter.pets.create(image: "https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4", name: 'Steve', approximate_age: 4, sex: 'Male', description: "I like to swim and eat potatoes!", status:"Adoptable")
    @karen = @cat_shelter.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s", name: 'Karen', approximate_age: 5, sex: 'Female', description: "I like to sit on laps and judge people.", status: "Adoptable")
  end

  describe 'when I am on the pets index page' do
    it 'can see all of the pets and their info' do
      visit '/pets'

      expect(page).to have_content(@steve.name)
      expect(page).to have_content(@steve.approximate_age)
      expect(page).to have_content(@steve.sex)
      expect(page).to have_content(@steve.shelter.name)

      expect(page).to have_content(@karen.name)
      expect(page).to have_content(@karen.approximate_age)
      expect(page).to have_content(@karen.sex)
      expect(page).to have_content(@karen.shelter.name)
      expect(page).to have_css("img[src*='https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4']")
      expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s']")
    end
  end

  describe 'when I visit a pet show page' do
    it 'can show all of the details for that pet' do
      visit "/pets/#{@steve.id}"

      expect(page).to have_css("img[src*='https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4']")
      expect(page).to have_content(@steve.name)
      expect(page).to have_content(@steve.description)
      expect(page).to have_content(@steve.approximate_age)
      expect(page).to have_content(@steve.sex)
      expect(page).to have_content(@steve.status)

      expect(page).to have_no_content(@karen.name)
    end
  end
end
