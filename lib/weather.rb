class Weather

  def stormy?
    random_condition == 'stormy'
  end

  private
  
  def random_condition
    ["clear", "clear", "clear", "stormy"].sample
  end
end
