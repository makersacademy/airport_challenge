require "airport"

describe Airport do
  describe 'land' do
    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'instructs a plane to land' do
      airport = Airport.new
      airport.set_weather("sunny")
      #subject.dock double(:bike)
      #subject.land double(:airport)
      #airport = double("airport")
      #puts airport.weather?
      #airport = double (:airport)
      #allow(airport).to receive(:weather?).and_return("sunny")
      #puts airport.weather?# airport = instance_double("airport", :weather => "sunny")
      # puts :weather
      plane = Plane.new
      #plane.set_status("land")
      # airport.set_weather("clear")
      airport.land(plane)
      expect(plane.status?).to eq ("land")
    end

    it 'prevents landing if stormy' do
      plane = Plane.new
      airport = Airport.new
      airport.set_weather("stormy")
      expect(subject.land(plane)).to eq ("landing not allowed")
    end

    it 'plane is set as landed' do
      airport = Airport.new
      plane = Plane.new
      airport.set_weather("sunny")
      airport.land(plane)
      expect(plane.status?).to eq ("land")
    end
  end

  describe 'takeoff' do
    it 'responds to takeoff' do
      expect(subject).to respond_to :takeoff
    end

    it 'instructs a plane to take off' do
      airport = Airport.new
      plane = Plane.new
      airport.set_weather("sunny")
      expect(plane.status?).to eq ("air")
    end

    it 'prevents takeoff if stormy' do
      plane = Plane.new
      airport = Airport.new
      airport.set_weather("stormy")
      airport.takeoff(plane)
      expect(airport.takeoff(plane)).to eq ("takeoff not allowed")
    end

    it 'plane is set as taken off' do
      airport = Airport.new
      plane = Plane.new
      airport.takeoff(plane)
      expect(plane.status?).to eq ("air")
    end
  end

  describe 'check_weather' do
    it "responds to check weather" do
      expect(subject).to respond_to :weather?
    end

    it 'checks the weather' do
      airport = Airport.new
      expect(airport.weather?).to eq('stormy').or(eq('sunny'))
    end
  end

  describe 'prevent_landing' do
    it "responds to prevent landing" do
      expect(subject).to respond_to :prevent_landing
    end

    it 'stops a plane from landing' do
      plane = Plane.new
      expect(subject.prevent_landing(plane)).to eq (true)
    end
  end

  describe 'check_capacity' do
    it "responds to check capacity" do
      expect(subject).to respond_to :capacity?
    end

    it 'checks capacity of the airport' do
      airport = Airport.new
      expect(subject.capacity?).to eq (true)
    end
  end

  describe 'set_capacity' do
    it "responds to set capacity" do
      expect(subject).to respond_to :set_capacity
    end

    it 'sets capacity of the airport' do
      airport = Airport.new
      expect(airport.set_capacity).to eq (true)
    end
  end

end
