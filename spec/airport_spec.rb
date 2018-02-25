require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  before(:each) do
    @fk_flying_plane = double(:landed => false)
    @fk_plane = double(:landed => true)
    @fk_plane_lander = double(:land => subject.park_plane(@fk_plane))
    @fk_plane_launcher = double(:takeoff => subject.park_plane(@fk_plane))
    @fk_weather_clear = double(:report => :clear)
    @fk_weather_stormy = double(:report => :stormy)
  end

  describe '#overide_capacity' do
    it 'allows a default capacity to be overidden' do
      subject.override_capacity(20)
      expect(subject.plane_capacity).to eq 20
    end
    it 'uses default values if not overidden' do
      expect(subject.plane_capacity).to eq 5
    end
  end

  describe '#land' do
    it 'lands a flying plane and parks it' do
      subject.land(@fk_plane_lander, @fk_weather_clear)
      expect(subject.confirm_arrival(@fk_plane)).to eq true
    end
    it "doesn't land a flying plane in stormy weather" do
      expect {
        subject.land(@fk_plane_lander, @fk_weather_stormy)
      }.to raise_error 'Weather is too stormy to land!'
    end
    it "doesn't land a flying plane when the park is full" do
      subject.override_capacity(0)
      expect {
        subject.land(@fk_plane_lander, @fk_weather_clear)
      }.to raise_error 'Airport cannot land any more planes at present!'
    end
  end


  #
  # describe '#confirm_departure' do
  #   it 'confirms that a plane is no longer in the airport' do
  #     fk_weather = double(:report => :clear)
  #     fk_plane = double()
  #     subject.parked_planes.push(fk_plane)
  #     fk_plane2 = double(:takeoff => subject.launch_plane(fk_plane))
  #     subject.takeoff(fk_plane2, fk_weather)
  #     expect(subject.confirm_departure(fk_plane)).to eq true
  #   end
  #   it 'does not confirms that a plane is no longer in the airport if it actually still is' do
  #     fk_plane = double()
  #     subject.parked_planes.push(fk_plane)
  #     expect(subject.confirm_departure(fk_plane)).to eq false
  #   end
  # end
  #
end
