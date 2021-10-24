require_relative './airport'

class Plane

end

=begin
  message = "starting up"

  def set_status(selection)
    case(selection)
    when taken_off
      message = "The plane is no longer at the airport"
    end
  end


    case
    when (Airport.take_off(plane)) == true
      puts "The plane is no longer at the airport"
    end

=end