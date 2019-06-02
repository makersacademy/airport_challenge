#require 'airport'
#require 'weather_report'

class Plane

  attr_accessor :status

  STATUSES = { 0 => "in air", 1 => "grounded" }

  def initialize(status = 0)
    @status = STATUSES[status]
  end

  def update
    if @status == STATUSES[0]
      @status = STATUSES[1]
    else
      @status = STATUSES[0]
    end 
  end

end