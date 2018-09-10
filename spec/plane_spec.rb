require 'plane'

describe Plane do
  before(:each) do
    @storm = double('weather')
    @no_storm = double('weather')
    allow(@storm).to receive(:is_stormy?) { true }
    allow(@no_storm).to receive(:is_stormy?) { false }
    @plane = Plane.new
    @airport = Airport.new(@no_storm)
    @stormy_airport = Airport.new(@storm)
  end

  it {should respond_to(:land)}

  context '#land' do
    it 'should land a plane in an airport' do
      @plane.land(@airport)
      expect(@airport.planes).to include(@plane)
    end

    it 'should raise an error if the plane tries to land twice' do
      expect{2.times {@plane.land(@airport)}}.to raise_error("This plane already landed!")
    end

    it 'raises an error when trying to land in a storm' do
      expect{@plane.land(@stormy_airport)}.to raise_error(
        "Can't land in stormy conditions!")
    end
  end

  it {should respond_to(:take_off)}

  context '#take_off' do
    it 'should make a plane take off from an airport' do
      @plane.land(@airport)
      @plane.take_off
      expect(@airport.planes.include? @plane).to eq false
    end

    it "raises an error if the plane is already in the air" do
      expect{@plane.take_off}.to raise_error(
        "This plane is already in the air!")
    end

    it "should raise an error if the plane tries to take off in a storm" do
      @plane = Plane.new(@stormy_airport)
      expect{@plane.take_off}.to raise_error(
        "Can't take off in stormy conditions!")
    end
  end
end
