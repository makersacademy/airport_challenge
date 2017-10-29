require 'plane_class'
require 'airport_class'

airport = Airport.new
plane = Plane.new

describe Airport do
  describe 'land() method respons' do
    it 'Check if Airport class respond to the method land' do
      expect(Airport.new).to respond_to(:land)
    end
  end

  describe 'land() method' do
    before do
      airport.weather = ['sunny']
      airport.land(plane)
    end
    it "Check if calling the method land a Plane land into the airport @hangars" do
      expect(airport.hangars[0]).to be_instance_of(Plane)
    end
  end

  describe 'take_off method respond' do
    it 'Check if Airport class respond to the method take_off' do
      expect(airport).to respond_to(:take_off)
    end
  end

  describe 'take_off method' do
    before do
      airport.weather = ['sunny']
      airport.take_off(0)
    end
    it "Check if the take_off method remove a Plane instance from @hangar" do
      expect(airport.hangars).to eq []
    end
  end

  describe 'take_off and land() method Errors' do
    before do
      airport.weather = ['stormy']
    end
    it "Check if the take_off method raise up an Error, when weather.sample is 'stormy'." do
      expect { airport.take_off(0) }.to raise_error("The weater is stormy, the plane can't depart.")
    end
    it "Check if land() raise up an Error when weather.sample is 'stormy'" do
      expect { airport.land(plane) }.to raise_error("The weather is stormy, the plane can't land.")
    end
  end

    describe 'initialize' do
      it "check if an instance of the class Airport can take 1 argument" do
        expect { Airport.new(15)}.not_to raise_error(ArgumentError)
      end
    end
    describe 'Airport class capacity' do
      it "land() raise up an error if @hangars full." do
        expect {Airport.new(0).land(plane)}.to raise_error("The Airport is full, the plane can't land")
      end
    end

end
