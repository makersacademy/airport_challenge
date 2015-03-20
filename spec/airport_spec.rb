require 'airport'

describe Airport do
  let(:plane) { double :plane, land: nil, take_off: nil }
  let(:airport) { Airport.new }
  let(:sunny_time) { allow(airport).to receive(:weather).and_return('sunny') }
  let(:stormy_time) { allow(airport).to receive(:weather).and_return('stormy') }
  # what if capacity is set to lower than number of planes currently docked?
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
end
