require 'rails_helper'

describe LegislatorsHelper do
  describe "#cycle" do
    it "generates a current list of campaign cycle years" do
      Timecop.freeze(Time.local(2015)) do
        expect(helper.election_cycles).to eq ["1990", "1992", "1994", "1996", "1998", "2000", "2002", "2004", "2006", "2008", "2010", "2012", "2014"] 
      end
    end
  end
end
