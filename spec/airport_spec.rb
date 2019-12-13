require './lib/airport'
require './lib/weather'

describe Airport do
  let(:airport) { Airport.new }
  let(:larger_airport) { Airport.new(200) }
  let(:plane) { Plane.new }


  it 'has a default capacity' do
    expect(airport.capacity).to eq 10
  end

  it 'can change capcity' do
    expect(airport.capacity).to_not eq larger_airport.capacity
  end

  describe "#land_plane" do
    context 'allows a plane to land' do
      it 'responds to landing' do
        allow(airport).to receive(:good_weather?).and_return(true)
        expect(airport.land_plane(plane)).to be true
      end

      it 'raises an error in stormy times' do
        allow(airport).to receive(:good_weather?).and_return(false)
        expect { airport.land_plane(plane) }.to raise_error "Bad Weather, cannot LAND"
      end

      it 'raises an error at capacity' do
        allow(airport).to receive(:good_weather?).and_return(true)
        10.times { airport.land_plane(plane) }
        expect { airport.land_plane(plane) }.to raise_error "Landing rejected, over capacity"
      end
    end
  end

  describe "#take_off" do
    context "Allows a plane to take off" do
      it 'responds to taking off' do
        expect(subject).to respond_to(:take_off)
      end
      it 'removes the instance of plane from Airport' do
        allow(airport).to receive(:good_weather?).and_return(true)
        airport.land_plane(plane)
        airport.take_off(plane)
        expect(airport.hanger).not_to include(plane)
      end
      it 'raises an error in stormy times' do
        airport.land_plane(plane)
        allow(airport).to receive(:good_weather?).and_return(false)
        expect { airport.take_off(plane) }.to raise_error "Stormy times, take off denied"
      end
    end
  end
end
