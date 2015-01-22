module LegislatorsHelper
  def election_cycles
    (1990..Date.today.year).select {|year| year.even?}.map(&:to_s)
  end

  def active(cycle, current)
    if cycle == current
      "class=active"
    end
  end
end
