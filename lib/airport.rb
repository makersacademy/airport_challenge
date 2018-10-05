class Airport

  def initialize(capacity = 0)
    @currenttraffic = 0
    @capacity = capacity
  end

  def addtraffic
    @currenttraffic +=1
    true
  end

  def reducetraffic
    @currenttraffic -=1
    true
  end

end
