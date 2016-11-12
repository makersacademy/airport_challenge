class Weather

  def weather_condition
    condition = rand(1..2)
    condition_options = {
                          :stormy => 1,
                          :sunny => 2,
                        }
    condition_options.key(condition)

  end
end
