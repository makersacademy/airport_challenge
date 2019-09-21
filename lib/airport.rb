require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(params)
    @weather = params[:weather]
    @capacity = params[:capacity] || DEFAULT_CAPACITY
    @hangar = []
  end

  def request_landing(plane)
    begin 
      safe?
      move_to_hangar(plane)
      :granted
    rescue RuntimeError => e
      raise "#{e.message} for landing" if e.message == "Not safe"

      raise e.message
    end
  end

  def request_takeoff(plane)
    begin 
      safe?
      remove_from_hangar(plane)
      :granted
    rescue RuntimeError => e
      raise "#{e.message} for takeoff"
    end
  end
  
  private

  def move_to_hangar(plane)
    @hangar << plane
  end

  def remove_from_hangar(plane)
    @hangar.delete(plane)
  end
  
  def safe?
    raise "Airport Full" if full?
    raise 'Not safe' unless @weather.sunny?

    true
  end
  
  def full?
    @hangar.count >= DEFAULT_CAPACITY
  end

  attr_accessor :hangar, :weather
end
