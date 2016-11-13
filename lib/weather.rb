class Weather

  def weather_rand
    condition = rand(1..100)
    weather_condition(condition)
  end

  def weather_condition(condition)
    optional_conditions = {
                            :stormy => 1,
                            :sunny => 2
                          }
    optional_conditions.key(condition)

  end
end
