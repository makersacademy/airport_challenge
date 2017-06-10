require_relative 'plane'

class Airport
  attr_reader :gates

  def initialize
    @gates = []
  end

  def instruct(args)
    action, plane = args.fetch(:action), args.fetch(:plane)

    action == "land" ? land(plane) : take_off(plane)
  end

  def report(action, plane)
    puts case action
    when "land" then "#{plane} has landed successfully."
    when "take off" then "#{plane} has taken off successfully."
    end
  end

  private
  def land(plane)
    report("land", plane)
    gates << plane
  end

  def take_off(plane)
    report("take off", plane)
    get_plane_from_gate(plane)
  end

  def get_plane_from_gate(plane)
    search = Proc.new { |ele| ele == plane }
    flight = gates.select(&search)
    gates.delete_if(&search)
    flight
  end
end
