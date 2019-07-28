class Airplane
  attr_reader :status

  def initialize
    @status = "flying"
    @airport = ""
  end

  def land_plane(airport)
    @status == "grounded" ? fail('Error: plane grounded') : @status = "grounded"
    @airport == airport ? fail('Error: already at airport') : @airport = airport
    puts "Success, plane landed at #{airport.airport_name}!"
  end

  def take_off(airport)
    @status == "flying" ? fail('Error: plane in sky') : @status = "flying"
    @airport != airport ? fail('Error: wrong airport') : @airport = ""
    puts "Success, plane took off!"
  end
end
