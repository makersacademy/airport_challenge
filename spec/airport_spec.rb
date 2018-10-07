require "airport"

describe Airport do
  context('when the weather is sunny') do
    before(:each) do
      allow(subject).to receive(:stormy?).and_return(false)
    end

    describe 'landing and take off in good weather' do
      it 'responds to land' do
        expect(subject).to respond_to :land
      end

      it 'instructs a plane to land' do
        plane = Plane.new
        subject.land(plane)
        expect(plane.status?).to eq "land"
      end

      it 'plane is set as landed' do
        plane = Plane.new
        subject.land(plane)
        expect(plane.status?).to eq "land"
      end

      it 'responds to takeoff' do
        expect(subject).to respond_to :takeoff
      end

      it 'instructs a plane to take off' do
        plane = Plane.new
        expect(plane.status?).to eq "air"
      end

      it 'plane is set as taken off' do
        airport = Airport.new
        plane = Plane.new
        airport.takeoff(plane)
        expect(plane.status?).to eq "air"
      end
    end
  end

  context('when the weather is stormy') do
    before(:each) do
      allow(subject).to receive(:stormy?).and_return(true)
    end

    describe 'prevent landing and take off in bad weather' do
      it 'prevents takeoff if stormy' do
        plane = Plane.new
        airport = Airport.new
        expect(airport.takeoff(plane)).to eq "takeoff not allowed"
      end

      it 'prevents landing if stormy' do
        plane = Plane.new
        expect(subject.land(plane)).to eq "landing not allowed"
      end
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
