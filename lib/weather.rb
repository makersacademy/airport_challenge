class Weather

  DEFAULT_CHANCE = 4

  def initialize(chance=DEFAULT_CHANCE)
  @chance=chance
  end

  def storm_maker
    rand(@chance)
  end

  def storm?
    storm_maker == 1 ? true : false
  end

end