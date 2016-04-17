module ErrorManager
  NOT_FOUND = "plane not at airport".freeze
  LANDED = "plane alreay on ground".freeze
  STORMY = "stormy weather".freeze
  FULL = "capacity full".freeze

  def check_errors(plane,land)
    fail LANDED if land && in_airport?(plane)
    fail NOT_FOUND unless land || in_airport?(plane)
    fail STORMY if stormy?
    fail FULL  if full?
  end
end