module LegislatorsHelper
  def active(cycle, current)
    if cycle == current
      "class=active"
    end
  end
end
