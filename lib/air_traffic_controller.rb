require_relative 'airport'

class AirTrafficController

  def request_taking_off_permission
    puts "Requesting permission to take off."

    request_permission
  end

  def request_landing_permission
    puts "Requesting permission to land."

    request_permission
  end

  def airport
    @airport ||= Airport.new
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