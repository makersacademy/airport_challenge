require 'airport'

describe 'Land plane and store in airport' do
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }
  let(:airport) { Airport.new(weather) }

  it 'lands plane and stores in airport' do
    land_plane_clear_weather(airport, weather, plane)
    expect(airport.planes).to eq [plane]
  end
  it 'confirms plane is not flying if plane lands in airport' do
    land_plane_clear_weather(airport, weather, plane)
    expect(plane.flying?).to eq false
  end
  it 'will not allow plane to land if weather stormy - error raised' do
    expect { land_plane_stormy_weather(airport, weather, plane) }.to raise_error 'Unable to land - weather is stormy'
  end

  context 'Airport at full capacity' do
    it 'will not allow further plane to land at default capacity -  error will be raised' do
      Airport::DEFAULT_CAPACITY.times { land_plane_clear_weather(airport, weather, Plane.new) }
      expect { land_plane_clear_weather(airport, weather, Plane.new) }.to raise_error 'Airport at full capacity'
    end
    it 'will not allow further planes to land - capacity overidden to new capacity' do
      airport.capacity = 10
      airport.capacity.times { land_plane_clear_weather(airport, weather, Plane.new) }
    end
  end
end
