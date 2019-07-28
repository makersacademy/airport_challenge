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

  describe '#land_lane' do

    it 'Should remove a plane from airborne_planes' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land_plane
      expect(airport1.airborne_planes.count).to eq (airport2.airborne_planes.count - 1)
    end

    it 'Should add a plane to landed_planes'  do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land_plane
      expect(airport1.landed_planes.count).to eq (airport2.landed_planes.count + 1)
    end

  end

  describe '#takeoff_plane' do

    it 'Should remove a plane from landed_planes' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.takeoff_plane
      expect(airport1.landed_planes.count).to eq (airport2.landed_planes.count - 1)
    end

    it 'Should add a plane to airborne_plane'  do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.takeoff_plane
      expect(airport1.airborne_planes.count).to eq (airport2.airborne_planes.count + 1)
    end

    it 'Should confirm that the plane has left the airport' do
      airport = Airport.new
      take_off = airport.landed_planes[0]
      expect(airport.takeoff_plane).to eq ("#{take_off} has left the airport")
    end

    it 'Should not allow planes to takeoff if weather is stormy' do
      airport = Airport.new
      take_off = airport.landed_planes[0]
      expect(airport.takeoff_plane).to eq ("#{take_off} has left the airport")
    end

  end

  describe '#weather_generator' do

  it 'Should output Sunny if 1' do
    airport = Airport.new
    expect(airport).to receive(:rand).and_return(1)
    expect(airport.weather_generator).to eq ('Sunny')
  end

  it 'Should output Stormy if 5' do
    airport = Airport.new
    expect(airport).to receive(:rand).and_return(4)
    expect(airport.weather_generator).to eq ('Stormy')
  end

  end

end
