module Weather

  STORM = 9

  def stormy?
      weather_generator == STORM
  end

  private

    def weather_generator
      rand(10)
    end
end
