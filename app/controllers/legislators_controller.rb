class LegislatorsController < ApplicationController
  def index
    if params["zipcode"]
      @legislators = Legislator.for_zipcode(params["zipcode"])
    elsif current_user && current_user.zipcode
      @legislators = Legislator.for_zipcode(current_user.zipcode)
    else
      @legislators = Legislator.all
    end
    @year = params["cycle"] || "2014"
  end
end
