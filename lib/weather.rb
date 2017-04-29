## This class is required to determine the weather conditions whenever a
## plane is meant to land or take off. It produces stormy weather 20% of the time
class Weather
  def stormy?
    1 + rand(10) >= 8
  end
end
