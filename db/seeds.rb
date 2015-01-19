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
      chamber: "house",
      facebook_id: "110757973488",
      twitter_id: "RepDianaDeGette",
      youtube_id: "RepDianaDeGette",
      phone: "202-225-4431",
      office: "2368 Rayburn House Office Building",
      website: "http://degette.house.gov")

    @gardner = FactoryGirl.create(:legislator, party: "R",
      first_name: "Cory",
      last_name: "Gardner",
      gender: "M",
      state: "CO",
      title: "Sen",
      chamber: "senate",
      facebook_id: "160924893954206",
      twitter_id: "RepCoryGardner",
      youtube_id: "CongressmanGardner",
      phone: "202-224-5941",
      office: "B40b Dirksen Senate Office Building",
      website: "http://www.gardner.senate.gov")

    @bennet = FactoryGirl.create(:legislator, party: "D",
      first_name: "Michael",
      last_name: "Bennet",
      middle_name: "F.",
      gender: "M",
      state: "CO",
      title: "Sen",
      chamber: "senate",
      facebook_id: "97172997732",
      twitter_id: "SenBennetCo",
      youtube_id: "SenatorBennet",
      phone: "202-224-5852",
      office: "458 Russell Senate Office Building",
      website: "http://www.bennet.senate.gov")

    puts "legislators generated"
  end

  def generate_contributors
    contributors_for(@degette)
    contributors_for(@gardner)
    contributors_for(@bennet)
    puts "contributors generated"
  end

  def contributors_for(legislator)
    FactoryGirl.create(:contributor, total_amount: 1000.00, employee_amount: 500.00, direct_amount: 500.00, legislator: legislator, cycle: "2014")
    FactoryGirl.create(:contributor, total_amount: 900.00, employee_amount: 300.00, direct_amount: 600.00, legislator: legislator, cycle: "2014")
    FactoryGirl.create(:contributor, total_amount: 750.00, employee_amount: 250.00, direct_amount: 500.00, legislator: legislator, cycle: "2014")
  end
end

Seed.new
