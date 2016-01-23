module Errors

  def full_airport_error
    fail "The airport is full"
  end

  def stormy_error
    fail "Can't #{yield} now, it's stormy!"
  end

  def plane_landed_error
    fail "This plane has already been landed"
  end

  def plane_flying_error
    fail "This plane is already flying"
  end

  def plane_exist_error
    fail "This plane doesn't exist here"
  end

end
