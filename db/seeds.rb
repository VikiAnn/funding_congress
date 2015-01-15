require 'faker'
require 'factory_girl_rails'
class Seed
  def initialize
    generate_legislators
    generate_contributors
  end

  def generate_legislators
    @degette = FactoryGirl.create(:legislator, party: "D",
      first_name: "Diana",
      last_name: "DeGette",
      middle_name: "L.",
      gender: "F",
      state: "CO",
      title: "Rep",
      chamber: "house")

    @gardner = FactoryGirl.create(:legislator, party: "R",
      first_name: "Cory",
      last_name: "Gardner",
      gender: "M",
      state: "CO",
      title: "Sen",
      chamber: "senate")

    @bennet = FactoryGirl.create(:legislator, party: "D",
      first_name: "Michael",
      last_name: "Bennet",
      middle_name: "F.",
      gender: "M",
      state: "CO",
      title: "Sen",
      chamber: "senate")

    puts "legislators generated"
  end

  def generate_contributors
    3.times do
      FactoryGirl.create(:contributor, legislator: @degette)
      FactoryGirl.create(:contributor, legislator: @gardner)
      FactoryGirl.create(:contributor, legislator: @bennet)
    end

    puts "contributors generated"
  end
end

Seed.new
