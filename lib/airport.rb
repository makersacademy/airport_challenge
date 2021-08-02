require "./lib/planes.rb"
class Airport
  CAPACITY  = 40 # planes
  RUNWAYS = 8 
  attr_reader :grounded, :runways, :capacity
  def initialize (capacity = CAPACITY, runways = RUNWAYS)
    @grounded = Array.new
    @capacity = capacity
    @runways = 1.upto(runways).to_a.map do |n|
      {number: n-1, status: "", reason: "", status_initiated_at: "unknown",
        status_check_at: "unknown", flight_number: "none"}
    end
  end

  def check_runway
    runway = @runways.find do |runway| 
        runway[:status] != :blocked
    end
    runway
  end

  def commit_runway(flight, procedure, time_to_proceed = 6)
    @flight = flight
    @procedure = procedure
    @time_to_proceed = time_to_proceed * 1000
    runway = check_runway
    if !runway.nil?
      @number = runway[:number]
      register_runway
      return true
    else
      return false
    end
  end

  def register_runway
    @runways[@number][:status] = :blocked
    @runways[@number][:flight_number] = @flight
    @runways[@number][:reason] = @procedure
    @runways[@number][:status_initiated_at] = Time.now.to_i  
    @runways[@number][:status_check_at] = Time.now.to_i + @time_to_proceed
  end

  def plane_landed(plane)
    @grounded.push(plane)
  end

  def plane_tookoff(plane)
    @grounded.delete(plane)
  end

  def is_full?
    @grounded.count >= @capacity 
  end
end