require "airport"

describe Airport do
  describe 'land' do
    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'instructs a plane to land' do
      plane = Plane.new
      expect(subject.land(plane)).to eq (true)
    end
  end

  describe 'takeoff' do
    it 'responds to takeoff' do
      expect(subject).to respond_to :takeoff
    end

    it 'instructs a plane to take off' do
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq (true)
    end
  end

  describe 'statuscheck' do
    it "responds to statuscheck" do
      expect(subject).to respond_to :statuscheck
    end

    it 'asks a plane for its status' do
      plane = Plane.new
      expect(subject.statuscheck(plane)).to eq (true)
    end
  end

  describe 'prevent_takeoff' do
    it "responds to prevent takeoff" do
      expect(subject).to respond_to :prevent_takeoff
    end

    it 'stops a plane from taking off' do
      plane = Plane.new
      expect(subject.prevent_takeoff(plane)).to eq (true)
    end
  end

  describe 'check_weather' do
    it "responds to check weather" do
      expect(subject).to respond_to :check_weather
    end

    it 'checks the weather' do
      plane = Plane.new
      expect(subject.check_weather(plane)).to eq (true)
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
      expect(subject).to respond_to :check_capacity
    end

    it 'checks capacity of the airport' do
      airport = Airport.new
      expect(subject.check_capacity(airport)).to eq (true)
    end
  end

  describe 'set_capacity' do
    it "responds to set capacity" do
      expect(subject).to respond_to :set_capacity
    end

    it 'sets capacity of the airport' do
      airport = Airport.new
      expect(subject.set_capacity(airport)).to eq (true)
    end
  end

end
