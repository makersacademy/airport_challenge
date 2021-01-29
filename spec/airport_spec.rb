require 'airport'
#require 'weather'

describe Airport do

  let(:airport) {Airport.new}

  describe '#can_land_a_plane' do
  it 'lands a plane at an airport, registers it' do
    airport.can_land_a_plane('new_flight_num')
    expect(airport.all_planes).to include 'new_flight_num'
  end
  end

  describe '#can_take_off' do
  it 'plane can take off and will be removed from the airport capacity' do
    airport.can_land_a_plane('new_flight_num')
    airport.can_take_off('new_flight_num')
    expect(airport.all_planes).not_to include 'new_flight_num'
  end
  end

  describe '#full_airport' do
    it 'does not land planes when the airport is full' do
      airport.can_land_a_plane('new_flight_num')
      35.times {airport.can_land_a_plane('new_flight_num')}
      expect(airport.can_land_a_plane('new_flight_num')).to eq 'airport is full now, cannot land any planes'
      #here I tried to use .to raise_error matcher but wasn't able to fix all the error of the failed text afterwards,
    end
  end
end