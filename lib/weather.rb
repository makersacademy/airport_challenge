class Weather


  def stormy?
    true if storms_coming
  end

  private

  def storms_coming
    (rand(0..50)) == 5
  end

end
