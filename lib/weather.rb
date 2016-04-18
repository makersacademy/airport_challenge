class Weather
  def stormy?
    chances_of_stormy > 0.8
  end

  private

  def chances_of_stormy
    rand
  end
end
