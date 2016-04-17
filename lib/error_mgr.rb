module ErrorManager
  NOT_FOUND = "plane not at airport".freeze
  LANDED = "plane alreay on ground".freeze
  STORMY = "stormy weather".freeze
  FULL = "capacity full".freeze

  def check_errors(plane,land)
    if land
      fail LANDED if in_airport?(plane)
    else
      fail NOT_FOUND if !in_airport?(plane)
    end
    fail STORMY if stormy?
    fail FULL  if full?
  end
end