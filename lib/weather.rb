class Weather
  SUNNY_STORYMY_RATIO_N_to_1 = 2

  def is_sunny?
    rand(SUNNY_STORYMY_RATIO_N_to_1) == 0 ? false : true
  end
  
end
