class Weather

  def random_condition
    @conditions.sample
  end

  def stormy?
    random_condition == :stormy ? true : false
  end

end 
