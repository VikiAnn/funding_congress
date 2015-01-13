class Legislator < ActiveRecord::Base
  def full_name_and_title
    "#{title} #{first_name} #{last_name}, #{party}"
  end
end
