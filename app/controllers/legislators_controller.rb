class LegislatorsController < ApplicationController
  def index
    get_legislators
    @year = params[:cycle] || "2014"
    @zipcode = params[:zipcode]
    respond_to do |format|
      format.html
      format.json { render json: @legislators.to_json(include: :contributors) }
      format.xml { render xml: @legislators.to_xml(include: :contributors) }
    end
  end

  private

  def get_legislators
    if params[:zipcode]
      @legislators = Legislator.for_zipcode(params[:zipcode])
    elsif current_user && current_user.zipcode
      @legislators = Legislator.for_zipcode(current_user.zipcode)
    else
      @legislators = Legislator.all
    end
  end
end
