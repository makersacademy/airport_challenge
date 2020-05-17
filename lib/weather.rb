class Weather

  SUNNY_WEIGHT = 0.8

  def self.generate
    case rand(1..100)
      when 1..SUNNY_WEIGHT * 100 then 'sunny'
      else 'stormy'
    end
  end
end
