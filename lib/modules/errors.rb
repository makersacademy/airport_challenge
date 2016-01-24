module Errors

  def full_airport_error
    fail "The airport is full"
  end

  def stormy_error
    fail "Can't #{yield}, it's stormy!"
  end

  def plane_error
    fail "This plane #{yield}"
  end

end
