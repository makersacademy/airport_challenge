class Weather

  def stormy?
    rand(1..10) <= RATEOUTOFTEN
  end

  RATEOUTOFTEN = 3
  private_constant :RATEOUTOFTEN

end
