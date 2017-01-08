require_relative 'airport'
require_relative 'weather'

class Plane
  attr_accessor :status

  def initialize
    @status = "flying"
  end

  def land(airport)
    unless !safe? || airport.full? || landed?
      airport.planes << self
      @status = "landed"
    end
  end

  def take_off(airport)
     unless !safe? || flying?
       airport::planes.delete(self)
       @status = "flying"
     end
  end

  private

  def safe?
    Weather.stormy? ? (raise "Unable to fly as weather is stormy") : true
  end

  def flying?
    @status == "flying" ? (raise "The plane is currently flying") : false
  end

  def landed?
    @status == "landed" ?  (raise "The plane has already landed") : false
  end

end
