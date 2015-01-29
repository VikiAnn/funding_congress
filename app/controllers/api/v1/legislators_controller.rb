class Api::V1::LegislatorsController < ApplicationController
  respond_to :json, :xml

  def index
    get_legislators
    @zipcode = params[:zipcode]
    respond_with @legislators
  end

  def show
    @legislator = Legislator.find(params[:id])
    respond_with @legislator
  end

  private

  def get_legislators
    if params[:zipcode]
      @legislators = Legislator.for_zipcode(params[:zipcode])
    else
      @legislators = Legislator.all
    end
  end
end
