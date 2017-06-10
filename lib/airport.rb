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
    raise "Plane not flying" if plane.grounded?
    gates << plane
    plane.grounded = true
    report("land", plane)
  end

  def take_off(plane)
    raise "Plane already flying" if !plane.grounded?
    leave_gate(plane)
    plane.grounded = false
    report("take off", plane)
  end

  def leave_gate(plane)
    search = Proc.new { |ele| ele == plane }

    raise "Plane not found" if gates.select(&search).empty?
    gates.delete_if(&search)
  end
end
