
class Plane

  # attr_accessor :make, :year, :color
  attr_reader :model_number, :flight_number
  # attr_writer :doors

  def initialize(options={})
    self.make = options[:model_number]
    self.year = (options[:flight_number]).to_i
  end

=begin
  def land
  end

  def take_off
  end
=end

end