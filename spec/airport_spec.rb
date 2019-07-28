require 'airport.rb'

describe Airport do

  it 'Should respond to land plane' do
    airport = Airport.new
    expect(airport).to respond_to :land_plane
  end

  it 'Should respond to takeoff_plane' do
    airport = Airport.new
    expect(airport).to respond_to :takeoff_plane
  end

  it 'Should respond to weather' do
    airport = Airport.new
    expect(airport).to respond_to :weather
  end

  it '@weather should return specific array' do
    airport = Airport.new
    expect(airport.weather).to eq ['Sunny','Sunny','Sunny','Sunny','Stormy']
  end

  it 'Should have functionality to change the airport capacity' do
    airport = Airport.new(4)
    expect(airport.capacity).to eq 4
  end

  describe '#land_plane' do

    it 'Should remove a plane from airborne_planes' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land_plane
      allow(airport1.weather_generator).to receive(:rand) { 0 }
      allow(airport2.weather_generator).to receive(:rand) { 0 }
      expect(airport1.airborne_planes.count).to eq (airport2.airborne_planes.count - 1)
    end

    it 'Should not allow planes to land if weather is stormy' do
      airport = Airport.new
      allow(airport).to receive(:rand) { 4 }
      expect(airport.land_plane).to eq ("No planes can land, due to stormy weather")
    end

    # it 'Should not allow planes to land if weather is stormy' do
    #   airport = Airport.new
    #   allow(airport.weather_generator).to receive(:rand) { 4 }
    #   expect(airport.land_plane).to eq ("No planes can land, due to stormy weather")
    # end

    it 'Should not allow plane to land if airport is at capacity' do
      airport = Airport.new(1)
      allow(airport).to receive(:rand) { 0 }
      expect(airport.land_plane).to eq ("No planes can land, the airport is at full capacity")
    end

    it 'Should add a plane to landed_planes'  do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land_plane
      allow(airport1.weather_generator).to receive(:rand) { 0 }
      allow(airport2.weather_generator).to receive(:rand) { 0 }
      expect(airport1.landed_planes.count).to eq (airport2.landed_planes.count + 1)
    end



  end

  describe '#takeoff_plane' do

    it 'Should remove a plane from landed_planes' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.takeoff_plane
      allow(airport1).to receive(:rand) { 0 }
      allow(airport2).to receive(:rand) { 0 }
      expect(airport1.landed_planes.count).to eq (airport2.landed_planes.count - 1)
    end

    it 'Should confirm that the plane has left the airport' do
      airport = Airport.new
      take_off = airport.landed_planes[0]
      allow(airport).to receive(:rand) { 0 }
      expect(airport.takeoff_plane).to eq ("#{take_off} has left the airport")
    end

    it 'Should allow planes to takeoff if weather is sunny' do
      airport = Airport.new
      take_off = airport.landed_planes[0]
      allow(airport).to receive(:rand) { 0 }
      expect(airport.takeoff_plane).to eq ("#{take_off} has left the airport")
    end

    it 'Should not allow planes to takeoff if weather is stormy' do
      airport = Airport.new
      take_off = airport.landed_planes[0]
      allow(airport).to receive(:rand) { 4 }
      expect(airport.takeoff_plane).to eq ("No planes can take off, due to stormy weather")
    end

    it 'Should add a plane to airborne_plane'  do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.takeoff_plane
      allow(airport1).to receive(:rand) { 0 }
      allow(airport2).to receive(:rand) { 0 }
      expect(airport1.airborne_planes.count).to eq (airport2.airborne_planes.count + 1)
    end


  end

  describe '#weather_generator' do

  it 'Should output Sunny if 1' do
    airport = Airport.new
    allow(airport).to receive(:rand) { 0 }
    expect(airport.weather_generator).to eq 'Sunny'
  end

  it 'Should output Stormy if 5' do
    airport = Airport.new
    allow(airport).to receive(:rand) { 4 }
    expect(airport.weather_generator).to eq 'Stormy'
  end

  end

end
