# require_relative 'airport'

class Weather

  CONDITIONS = [:sunny, :sunny, :sunny, :stormy, :sunny]

    def random_conditions
      CONDITIONS.sample
    end

    def stormy?
      random_conditions == :stormy ? true : false
    end
end
