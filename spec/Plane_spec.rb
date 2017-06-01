require 'Plane.rb'
require 'Airport.rb' #only required Airport.rb to fetch its DEFAULT_CAPACITY (see line 12ish)

describe Plane do
  let(:airport) {double :airport}
  let(:good_weather) {double :good_weather}
  let(:bad_weather) {double :bad_weather}

  before(:each) do
    allow(good_weather).to receive(:stormy?).and_return(false)
    allow(bad_weather).to receive(:stormy?).and_return(true)
    allow(airport).to receive(:capacity).and_return(Airport::DEFAULT_CAPACITY) #the default capacity
    allow(airport).to receive(:docked_planes).and_return([]) #by default the airport is empty
    allow(airport).to receive(:add_plane).and_return([subject])
    allow(airport).to receive(:remove_plane).and_return([])
  end

  describe '.land_at' do
    it 'allows planes to land at a specific Airport' do
      subject.land_at(airport, good_weather)
      expect(subject.location).to eq airport
    end

    it 'it does not allow planes to land when weather is bad' do
      subject.land_at(airport, bad_weather)
      expect(subject.location).to eq(nil)
    end

    it 'is possible to confirm if the plane has landed at an airport' do
      subject.land_at(airport, good_weather) #making sure the
      expect(subject.confirm_location).to eq("The plane is currently at #{airport}.")
    end

    it 'confirms that the plane has landed when it successfully lands' do
      expect(subject.land_at(airport, good_weather)).to eq("The plane is currently at #{airport}.")
    end

    it 'does not allow a plane to land when the airport is full' do
      allow(airport).to receive(:capacity).and_return(4) # an airport with 4 spaces for planes
      allow(airport).to receive(:docked_planes).and_return([subject,subject,subject,subject]) #and 4 planes in it
      expect(subject.land_at(airport, good_weather)).to eq("There are no free spaces at that airport.")
    end

    it 'is not possible for a plane that is laneded to land again' do
      subject.land_at(airport, good_weather)
      expect(subject.land_at(airport, good_weather)).to eq("The plane is already on the ground at #{airport}")
    end
  end

  describe '.take_off' do
    it 'confirms it has taken off when it successfully takes off' do
      subject.land_at(airport, good_weather)
      expect(subject.take_off(good_weather)).to eq("The plane is currently in the air.")
    end

    it 'does not take off when the weather is bad' do
      subject.land_at(airport, good_weather)
      expect(subject.take_off(bad_weather)).to eq("Can not take off in stormy weather. The plane is currently at #{airport}.")
    end

    it 'is not possible for a plane that is already flying to take off' do
      subject.land_at(airport, good_weather)
      subject.take_off(good_weather)
      expect(subject.take_off(good_weather)).to eq("The plane is already in the air")
    end
  end

  describe '.confirm_location' do
    it "will confirm the plane's correct location when in the air" do
      subject.land_at(airport, good_weather)
      subject.take_off(good_weather)
      expect(subject.confirm_location).to eq("The plane is currently in the air.")
    end

    it "will confirm the plane's correct location when in an airport" do
      subject.land_at(airport, good_weather)
      expect(subject.confirm_location).to eq("The plane is currently at #{airport}.")
    end

  end

  describe '.install_at' do
    it 'will install a plane at an airport regardless of weather' do
      subject.install_at(airport)
      expect(subject.location).to eq(airport)
    end

    it 'is only possible to use once' do
      subject.install_at(airport)
      subject.take_off(good_weather)
      expect{subject.install_at(airport)}.to raise_error("You can only 'install' a plane at an airport once")
    end
  end

  describe 'feature tests' do
    it 'will land and take off multiple planes' do
      airport = Airport.new
      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      plane4 = Plane.new
      plane5 = Plane.new
      weather = Weather.new

      puts airport
      puts airport.docked_planes
      puts

      plane1.land_at(airport, weather)
      plane2.land_at(airport, weather)
      plane3.land_at(airport, weather)
      plane4.land_at(airport, weather)
      plane5.land_at(airport, weather)

      puts airport
      puts airport.docked_planes
      puts

      plane1.take_off(weather)
      plane2.take_off(weather)
      plane3.take_off(weather)
      plane4.take_off(weather)
      plane5.take_off(weather)

      puts airport
      puts airport.docked_planes
      puts
      
      expect(airport.docked_planes).to eq([])
    end
  end
end
