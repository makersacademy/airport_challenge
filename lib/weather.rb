class Weather

    def bad?
      #20% chances of bad weather
      true if rand(1..5) == 1
    end

end
