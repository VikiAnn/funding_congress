require 'faker'
require 'factory_girl_rails'
class Seed
  def initialize
    generate_legislators
    generate_contributors
  end

  def generate_legislators
    FactoryGirl.create(:legislator, first_name: "Diana",
    last_name: "DeGette",
    middle_name: "L.",
    gender: "F",
    state: "CO",
    title: "Rep",
    chamber: "house")
  end

end
