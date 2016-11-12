class Weather

  def right_now

      random_generator = rand(10)

        if random_generator < 8
          return "Sunny"
        else
          return "Stormy"
        end
  end
end
