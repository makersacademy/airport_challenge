class Safety

  def instruct_take_off
    if stormy_weather? == true
      "Do not take off in this weather"
    else
      "Please take off now"
    end
  end

  def instruct_land
    if stormy_weather? == true && airport_full? == true
      "Please land at an alternative airport due to the storm"
    elsif stormy_weather? == true && airport_full? == false
      "Please land at an alternative airport due to the storm"
    elsif stormy_weather? == false && airport_full? == true
      "Please continue circling until a space becomes available"
    elsif stormy_weather == false && airport_full? == false
      "You are given the all-clear to land."
    end
  end

end
