require 'airport'

describe Airport do
  let(:plane) { double :plane, land: nil, take_off: nil }
  let(:airport) { Airport.new }
  let(:sunny_time) { allow(airport).to receive(:weather).and_return('sunny') }
  let(:stormy_time) { allow(airport).to receive(:weather).and_return('stormy') }

  before do
    airport.add_flight(:flight)
  end

  it 'can set a custom capacity' do
    initial_capacity = airport.capacity
    airport.capacity = -1 # in case we happen to set it to the default cap
    expect(airport.capacity).not_to eq initial_capacity
  end

  context 'taking off and landing:' do
    it 'a plane can land in good weather' do
      sunny_time
      airport.land_plane(plane)
      expect(airport.planes.length).to eq 1
    end

    it 'a plane can take off in good weather' do
      sunny_time
      airport.land_plane(plane)
      airport.initialize_take_off(plane)
      expect(airport.planes.length).to eq 0
    end

  end

  context 'traffic control:' do

    it 'a plane cannot land if the airport is full' do
      sunny_time
      airport.capacity = 20
      20.times { airport.land_plane(plane) }
      expect { airport.land_plane(plane) }.to raise_error 'Airport full'
    end

    context 'weather conditions:' do
      it 'error raised when plane landing or taking off in bad weather' do
        stormy_time
        error_msg = 'Can not land, bad weather'
        expect { airport.land_plane(plane) }.to raise_error error_msg
        error_msg = 'Can not take off, bad weather'
        expect { airport.initialize_take_off(plane) }.to raise_error error_msg
      end
    end
  end
  context 'passenger travel:' do
    it 'can add a flight to schedule' do
      airport.add_flight('BA444')
      expect(airport.flights.include?('BA444')).to eq true
    end

    it 'can check in passengers to a flight' do
      expect(airport).to respond_to :check_in
    end

    it 'has number of checked in passengers' do
      airport.check_in(:person, :flight)
      airport.check_in(:person2, :flight)
      expect(airport.checked_in_passengers.length).to eq 2
      expect(airport.checked_in_passengers.include?(:person)).to eq true
    end

    it 'can check out passengers' do
      expect(airport).to respond_to :check_out
    end

    it 'no longer considers passenger "in the airport" when checked out' do
      airport.check_in(:person, :flight)
      airport.check_out(:person)
      expect(airport.checked_in_passengers.include?(:person)).to eq false
    end

    it 'raises an error if passenger already checked in' do
      airport.check_in(:person, :flight)
      err_msg = 'Already checked in'
      expect { airport.check_in(:person, :flight) }.to raise_error err_msg
    end

    xit 'passengers can be boarded on a flight'
    xit 'raises error if passengers boarded on wrong flight'
    xit 'can check if all passengers are boarded'
    xit 'can warn passengers of last call'
  end
end
