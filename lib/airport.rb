require "./lib/planes.rb"
class Airport
  CAPACITY  = 40 # planes
  RUNWAYS = 8 
  attr_reader :grounded, :runways
  def initialize (capacity = CAPACITY, runways = RUNWAYS)
    @grounded = Array.new
    @capacity = capacity
    @runways = 1.upto(runways).to_a.map do |n|
      return {number: n,
        status: "",
        reason: "",
        status_initiated_at: "unknown",
        status_check_at: "unknown",
        flight_number: "none"
      }
    end
    puts @runways.to_s
  end

  def check_runway
    runway = @runways.find do |runway| 
        runway[:status] != :blocked
    end
    runway
  end

  def commit_runway(flight, procedure, time_to_proceed = 6)
    time_to_proceed = time_to_proceed * 1000
    runway = check_runway
    if !runway.nil?
      number = runway[:number]
      @runways[number][:status] = :blocked
      @runways[number][:flight_number] = flight
      @runways[number][:reason] = procedure
      @runways[number][:status_initiated_at] = Time.now.to_i  
      @runways[number][:status_check_at] = Time.now.to_i + time_to_proceed
      return true
    else
      return false
    end
  end

end