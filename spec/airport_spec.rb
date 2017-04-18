require 'airport'

describe Airport do
  subject(:airport){ described_class.new }
  let (:airplane){ double :airplane }
  let (:badweather) {double :badweather, goodweather?: false}
  let (:goodweather) {double :goodweather, goodweather?: true}


  context "Initialize" do

    it "initializes with a DEFAULT_CAPACITY of 20" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "allows a default value to be set when creating a new airport" do
      large_airport = Airport.new 25
      expect(large_airport.capacity).to eq 25
    end
  end

  context "Landing and takeoff" do

    it "allows airplanes to land" do
       is_expected.to respond_to :land
    end

    it "allows airplanes to takeoff" do
       is_expected.to respond_to :takeoff
    end

    it "does not allow airplanes to land if the tarmac is full" do
      small_airport = Airport.new 1
      small_airport.land(airplane, goodweather.goodweather?)
      expect{small_airport.land(airplane, goodweather.goodweather?)}.to raise_error("Too many planes on the tarmac, assume holding pattern")
    end
  end

  context "Bad weather routines" do

    it "does not allow planes to land during storms" do
      expect {airport.land(airport, badweather.goodweather?)}.to raise_error("Can't land until skies are clear")
    end

    it "does not allow planes to take off during storms" do
      expect {airport.takeoff(airport, badweather.goodweather?)}.to raise_error("Can't get going until skies are clear")
    end

  end

  context "Tarmac" do

    it "knows which planes are visiting" do
      airport.land(airplane, goodweather.goodweather?)
      expect(airport.tarmac).to include airplane
    end

    it "does not include airplanes that have taken off" do
      airport.land(airplane, goodweather.goodweather?)
      airport.takeoff(airplane, goodweather.goodweather?)
      expect(airport.tarmac).to_not include airplane
    end

  end
end
