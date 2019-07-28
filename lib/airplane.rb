require_relative 'airport'

class Airplane
  attr_reader :status

  def initialize
    @status = "flying"
    @airport = ""
  end

  def land_plane(airport)
    fail('Error: plane grounded') unless @status == "flying"
    fail('Error: already at airport') unless @airport == ""
    @status = "grounded"
    @airport = airport
    puts "Success, plane landed at #{airport.airport_name}"
  end

  def take_off(airport)
    fail('Error: plane in sky') unless @status == "grounded"
    fail('Error: wrong airport') unless @airport == airport
    puts "Success, plane took off from #{airport.airport_name}!"
    @status = "flying"
    @airport = ""
  end
end
