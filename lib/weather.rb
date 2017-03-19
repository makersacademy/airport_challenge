class Weather
  attr_reader :weather
  SUNNY_STORYMY_RATIO_N_to_1 = 2

  def is_sunny?
    @weather = rand(SUNNY_STORYMY_RATIO_N_to_1) == 0 ? false : true
  end
end
