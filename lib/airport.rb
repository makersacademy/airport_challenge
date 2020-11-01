class Airport

  attr_reader :hangar

  def initialize(weather = 'sunny')
    @weather = weather
    @hangar = []
  end

  def land(plane)

    raise "The weather is too stormy!" if @weather == 'stormy'

    raise "Airport at Capacity!" if @hangar.length >= 20

    @hangar << plane

  end

  def take_off(plane)

    if @weather == 'stormy'
      puts "The weather is too stormy!"
    else
      hangar.delete(plane)
    end

  end

  def hangar_count
    hangar.count
  end

end
