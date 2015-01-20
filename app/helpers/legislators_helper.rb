module LegislatorsHelper
  def election_cycles
    (1990..Date.today.year).select {|year| year.even?}.map(&:to_s)
  end
end
