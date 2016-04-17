module Weather

  def stormy?
      weather_generator == 9
  end

  private

    def weather_generator
      rand(10)
    end
end
