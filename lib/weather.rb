require_relative "airport"

class Weather

  def self.stormy?
    rand(1..10) > 7
  end

end
