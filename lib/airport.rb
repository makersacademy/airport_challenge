class Airport


  def initialize
    @plane_in_airport = true
    @stormy = false
  end

  def instruct_land
    # if @stormy == true
    #   return
    # end
    @plane_in_airport = true
  end

  def instruct_take_off
    # if @stormy == true
    #   return
    # end
    @plane_in_airport = false
  end

  def plane_is_in_airport
    @plane_in_airport
  end

def weather
  return rand
end

  # def set_stormy(true_or_false)
  #   @stormy = true_or_false
  # end

  # def plane_not_in_airport
  #   @plane_in_airport = false
  # end
end
