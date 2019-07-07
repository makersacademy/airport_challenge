require 'airport'

describe Airport do

  airport = Airport.new
  plane = Plane.new

  it 'has a defult capacity' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#Take_off" do
    it "Doesn't take off with 'stormy weather'" do
      allow(airport).to receive(:random_weather) {"stormy"}
      expect{airport.take_off(plane)}.to raise_error "The plane can't take off with the stormy weather"
    end

    it "Gives the message the plane took off" do
       allow(airport).to receive(:random_weather) {"sunny"}
       plane.flying?(true)
       expect{airport.take_off(plane)}.to eq "The plane took off"
     end
  end

  describe "#land" do
    it "Can't land cause of stormy weather" do
      allow(plane).to receive(:fly?).and_return(true)
      allow(airport).to receive(:random_weather) {"stormy"}
      expect{airport.take_off(plane)}.to raise_error "The plane can't take off with the stormy weather"
    end

    it "Error airport full" do
      allow(airport).to receive(:random_weather) {"sunny"}
      50.times { airport.land(plane)}
      expect {airport.land double(:plane)}.to raise_error "The airport is full"
    end
  end

    describe "#random_weather" do
      it "check random weather" do
      Kernel.stub(:random_weather).with(4) { "stormy" }
    end
  end
end
