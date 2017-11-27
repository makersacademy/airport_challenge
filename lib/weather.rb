class Weather

  def stormy?
    outlook == :stormy
  end

  private

  def outlook
    random_number = rand(101)
    random_number == 100 ? :stormy : :sunny
  end

end
