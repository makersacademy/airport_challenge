class Weather

  attr_reader :condition

  def stormy?
    @condition = ['sunny', 'overcast', 'stormy'].shuffle.first
  end

end
