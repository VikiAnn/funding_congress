class LegislatorsController < ApplicationController
  def index
    # CHANGE THIS LATER, VIKI... something like Legislator.for_current_user
    @legislators = Legislator.all
    @year = params["cycle"] || "2014"
  end
end
