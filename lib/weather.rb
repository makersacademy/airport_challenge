class Weather

  attr_reader :stormy

  def stormy?
    @stormy = true if storms_coming
  end


end

  private

  def storms_coming
    (rand(0..50)) == 5
  end
