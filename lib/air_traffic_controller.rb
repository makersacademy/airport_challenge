require_relative 'airport'

class AirTrafficController

  def request_taking_off_permission
    puts "requested taking off permision"
    request_permision
  end

  def request_landind_permision
    request_permision
    puts "requested landed permision"
  end

  def airport
    airport ||= Airport.new
  end

  private

  def request_permision
    if airport.to_sym == :opering
      puts "permisino afirmative"
      :afirmative
    else
      puts "permisino negative"
      :negative
    end
  end

end