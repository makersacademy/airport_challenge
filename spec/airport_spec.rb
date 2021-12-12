require 'airport'

describe Airport do
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:check_weather) }
  
  it 'has a capacity attribute, set to 1 by default' do
    expect(airport.capacity).to eq(1)
  end

  it 'has capacity 2 when specified as parameter' do
    airport = Airport.new(2)
    expect(airport.capacity).to eq(2)
  end

  describe '#land_plane(plane)' do
    it 'returns a plane, after landing' do
      expect(airport.land_plane(plane)).to eq plane
    end

    it 'is full; raises an error when landing' do
      airport.land_plane(plane)
      expect { airport.land_plane(plane) }.to raise_error("Permission not granted. The airport is full.")
    end
  end
    
  describe '#take_off(plane)' do
    #when it is sunny we want to get the plane
    it 'returns a plane, after take off' do
      airport = Airport.new
      allow(airport).to receive(:check_weather) { 'sunny' }
      expect(airport.take_off(plane)).to eq plane
    end

    # When it is stormy, we want to get an error
    it 'raises an error when stormy and taking_off' do
      airport = Airport.new
      allow(airport).to receive(:check_weather) { 'stormy' }
      expect { airport.take_off(plane) }.to raise_error("Permission denied. Stormy weather")
    end
  end

  describe '#check_weather' do
    it 'returns "sunny" or "stormy"' do
      expect(airport.check_weather).to eq("sunny").or eq("stormy")
    end

    it 'returns stormy when rand(5) is 4' do
      allow(airport).to receive(:rand) { 4 }
      expect(airport.check_weather).to eq("stormy")
    end

    it 'returns sunny when rand(5) is 0' do
      allow(airport).to receive(:rand) { 0 }
      expect(airport.check_weather).to eq("sunny")
    end

    it 'returns sunny when rand(5) is 3' do
      allow(airport).to receive(:rand) { 3 }
      expect(airport.check_weather).to eq("sunny")
    end
  end
end

# describe Weather do
#   let(:weather) { Weather.new }

#   it { is_expected.to respond_to(:generate) }

#   describe '#generate' do
  
#     it 'returns "sunny" or "stormy"' do
#       expect(weather.generate).to eq('stormy').or eq('sunny')
#     end

#     it 'returns "stormy" when randomiser is 4' do
#       weather = Weather.new
#       allow(weather).to receive(:rand) { 4 }
#       expect(weather.generate).to eq('stormy')
#     end
    
#     it 'returns "sunny when randomiser is 3' do
#       weather = Weather.new
#       allow(weather).to receive(:rand) { 3 }
#       expect(weather.generate).to eq('sunny')
#     end

#     it 'returns "sunny when randomiser is 0' do
#       weather = Weather.new
#       allow(weather).to receive(:rand) { 0 }
#       expect(weather.generate).to eq('sunny')
#     end

#   end
# end
