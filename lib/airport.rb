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
    rescue Exception => error
      raise "#{error.message} for landing" if error.message == "Not safe"
      raise error.message
    end
  end

  def request_takeoff(plane)
    begin 
      safe?
      remove_from_hangar(plane)
      :granted
    rescue Exception => error
      raise "#{error.message} for takeoff"
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
    raise 'Not safe' if !@weather.sunny?
    true
  end
  
  def full?
    if @hangar.count >= DEFAULT_CAPACITY
      true
    else 
      false
    end
  end

  attr_accessor :hangar, :weather
end