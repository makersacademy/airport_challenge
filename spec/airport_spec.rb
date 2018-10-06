require "airport"

describe Airport do
  describe 'land' do
    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'instructs a plane to land' do
      # airport = Airport.new
      puts subject.weather?
      subject.update_weather("sunny")
      # allow(airport).to receive(:weather?).and_return("sunny")
      plane = Plane.new
      # plane.update_status("land")
      # airport.update_weather("clear")
      subject.land(plane)
      expect(plane.status?).to eq "land"
    end

    it 'prevents landing if stormy' do
      plane = Plane.new
      # airport = Airport.new
      subject.update_weather("stormy")
      expect(subject.land(plane)).to eq "landing not allowed"
    end

    it 'plane is set as landed' do
      # airport = Airport.new
      plane = Plane.new
      subject.update_weather("sunny")
      subject.land(plane)
      expect(plane.status?).to eq "land"
    end
  end

  describe 'takeoff' do
    it 'responds to takeoff' do
      expect(subject).to respond_to :takeoff
    end

    it 'instructs a plane to take off' do
      # airport = Airport.new
      plane = Plane.new
      subject.update_weather("sunny")
      expect(plane.status?).to eq "air"
    end

    it 'prevents takeoff if stormy' do
      plane = Plane.new
      airport = Airport.new
      airport.update_weather("stormy")
      expect(airport.takeoff(plane)).to eq "takeoff not allowed"
    end

    it 'plane is set as taken off' do
      airport = Airport.new
      plane = Plane.new
      airport.takeoff(plane)
      expect(plane.status?).to eq "air"
    end
  end

  describe 'check_weather' do
    it "responds to check weather" do
      expect(subject).to respond_to :weather?
    end

    it 'checks the weather' do
      # airport = Airport.new
      expect(subject.weather?).to eq('stormy').or(eq('sunny'))
    end
  end

  # describe 'prevent_landing' do
  #   it "responds to prevent landing" do
  #     expect(subject).to respond_to :prevent_landing
  #   end
  #
  #   it 'stops a plane from landing' do
  #     plane = Plane.new
  #     expect(subject.prevent_landing(plane)).to eq (true)
  #   end
  # end

  describe 'check_capacity' do
    it "responds to check capacity" do
      expect(subject).to respond_to :capacity?
    end

    it 'checks capacity of the airport' do
      # airport = Airport.new
      expect(subject.capacity?).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'full?' do
    it "responds to full?" do
      expect(subject).to respond_to :full?
    end

    it 'raises an error when full' do
      subject.update_weather("sunny")
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  describe 'update_capacity' do
    it "responds to set capacity" do
      expect(subject).to respond_to :update_capacity
    end

    it 'sets capacity of the airport' do
      # airport = Airport.new
      expect(subject.update_capacity).to eq true
    end
  end

end
