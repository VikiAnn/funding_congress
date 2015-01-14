class Legislator < ActiveRecord::Base
  has_many :contributors

  def full_name_and_title
    "#{title} #{first_name} #{last_name}, #{party}"
  end
end
