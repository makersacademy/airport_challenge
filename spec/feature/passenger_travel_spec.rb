require 'capybara/rspec'
require 'passenger_plane'
require 'generator'
# Might want to make a simulator class that generates passengers, planes, etc
# Going to need passenger check in method

# Make some user stories (idea: lanes)
feature 'Passenger travel:' do
  let(:airport) { Airport.new }
  let(:passengers) { [(Passenger.new '3684536'), (Passenger.new '523452')] }

  before do
    airport.add_flight('BA444')
    airport.add_flight('NZ8973')
  end
  context 'Check in' do
    scenario 'Passengers can be checked to a flight at an airport' do
      airport.check_in(passengers[0], 'BA444')
      airport.check_in(passengers[1], 'BA444')
      airport.check_in(passengers[2], 'NZ8973')
      expect(airport.checked_in_passengers.length).to eq 3
      expect(airport.checked_in_passengers.include?(passengers[0])).to eq true
    end

    scenario 'Error raised at check in if flight is no longer available' do
      err_msg = 'Flight not available'
      expect { airport.check_in(passengers[0], 'BA666') }.to raise_error err_msg
    end

    scenario 'Error raised if passenger already checked in' do
      passenger = passengers[0]
      airport.check_in(passenger, 'BA444')
      err_msg = 'Already checked in'
      expect { airport.check_in(passenger, 'BA444') }.to raise_error err_msg
    end

    scenario 'Passengers can be checked-out (missed flight)' do
      airport.check_in(passengers[0], 'BA444')
      airport.check_out(passengers[0])
      expect(airport.checked_in_passengers.include?(passengers[0])).to eq false
    end

    xscenario 'Passengers can be boarded on a flight'
    xscenario 'Error raised if passengers boarded on wrong flight'
    xscenario 'Can check if all passengers are boarded'
    xscenario 'Can warn passengers of last call'
  end
end
