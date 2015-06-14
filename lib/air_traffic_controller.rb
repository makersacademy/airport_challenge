require_relative 'airport'

class AirTrafficController

  def request_taking_off_permission
    puts "requested taking off permission"
    
    request_permission
  end

  def request_landing_permission
    puts "requested landed permission"

    request_permission
  end

  def airport
    airport ||= Airport.new
  end

  private

  def request_permission
    if airport.to_sym == :opering
      puts "Afirmative!"

      :afirmative
    else
      puts "Negative!"

      :negative
    end
  end

end