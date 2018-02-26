require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  before(:each) do
    @fk_plane = double(
      :ping => 'I am a plane.',
      :land => nil,
      :takeoff => nil,
      :landed => true
    )
    @fk_non_plane = double(
      :ping => 'I am actually a bird.',
      :land => nil,
      :takeoff => nil,
      :landed => true
    )
    @fk_weather_clear = double(:report => :clear)
    @fk_weather_stormy = double(:report => :stormy)
  end

  describe '#land' do
    it 'confirms a succesful landing' do
      airport.land(@fk_plane, @fk_weather_clear)
      expect(airport.confirm_arrival(@fk_plane)).to eq true
    end
    it "doesn't land a non-plane" do
      expect {
        airport.land(@fk_non_plane, @fk_weather_stormy)
      }.to raise_error "That isn't a plane!"
    end
    it "doesn't land a plane in stormy weather" do
      expect {
        airport.land(@fk_plane, @fk_weather_stormy)
      }.to raise_error 'Weather is too stormy to land!'
    end
    it "doesn't land a plane when the park is full" do
      airport.override_capacity(0)
      expect {
        airport.land(@fk_plane, @fk_weather_clear)
      }.to raise_error 'Airport cannot land any more planes at present!'
    end
    it "doesn't land a plane that is already parked in the airport" do
      airport.land(@fk_plane, @fk_weather_clear)
      expect {
        airport.land(@fk_plane, @fk_weather_clear)
      }.to raise_error 'Plane is already parked here!'
    end
  end

  describe '#takeoff' do
    it 'confirms a succesful departure' do
      airport.land(@fk_plane, @fk_weather_clear)
      airport.takeoff(@fk_plane, @fk_weather_clear)
      expect(airport.confirm_departure(@fk_plane)).to eq true
    end
    it "doesn't order a takeoff in stormy weather" do
      airport.land(@fk_plane, @fk_weather_clear)
      expect {
        airport.takeoff(@fk_plane, @fk_weather_stormy)
      }.to raise_error 'Weather is too stormy to take off!'
    end
    it "doesn't order a takeoff unless plane is parked in airport" do
      expect {
        airport.takeoff(@fk_plane, @fk_weather_clear)
      }.to raise_error 'Plane is not parked here!'
    end
  end

  describe '#overide_capacity' do
    it 'allows a default capacity to be overidden' do
      airport.override_capacity(20)
      expect(airport.plane_capacity).to eq 20
    end
    it 'does not allow negative capacity to be set' do
      expect {
        airport.override_capacity(-1)
      }.to raise_error 'Please enter an integer >= 0'
    end
    it 'does not allow non-integer capacity to be set' do
      expect {
        airport.override_capacity(3.7)
      }.to raise_error 'Please enter an integer >= 0'
    end
    it 'uses default values if not overidden' do
      expect(airport.plane_capacity).to eq 5
    end
  end

  describe '#ping' do
    it 'responds to a transponder ping' do
      expect(airport.ping).to eq 'I am an airport.'
    end
  end

end
