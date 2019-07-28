class Airplane
  attr_reader :status

  def initialize
    @status = "flying"
    @airport = ""
  end

  def land_plane(airport)
    @status == "grounded" ? fail('Error - plane already grounded') : @status = "grounded"
    @airport == airport ? fail('Error - plane already at that airport') : @airport = airport
    puts "Success, plane landed at #{airport.airport_name}!"
  end

  def take_off
    @status == "flying" ? fail('Error - plane already in sky') : @status = "flying"
    @airport = ""
    puts "Success, plane took off!"
  end
end
