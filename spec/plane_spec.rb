require 'plane'

describe Plane do
  before(:each) do
    @storm = double('weather')
    @no_storm = double('weather')
    allow(@storm).to receive(:is_stormy?) { true }
    allow(@no_storm).to receive(:is_stormy?) { false }
    @plane = Plane.new
    @airport = Airport.new(@no_storm)
    puts "Before:each made it here"
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
  end

  it {should respond_to(:take_off)}
  context '#take_off' do
    it 'should make a plane take off from an airport' do
      @plane.land(@airport)
      @plane.take_off(@airport)
      expect(@airport.planes.include? @plane).to eq false
    end
    it "should raise an error if the plane is already in the air" do
      expect{@plane.take_off(@airport)}.to raise_error("This plane is already in the air!")
    end
    it "should raise an error if the plane tries to take off from the wrong airport" do
      @plane.land(@airport)
      airport2 = Airport.new(@no_storm)
      expect{@plane.take_off(airport2)}.to raise_error(
        "The plane can only take off from the airport where it is grounded!")
    end
    it "should raise an error if the plane tries to take off in a storm" do
      @airport = Airport.new(@storm)
      @plane.land(@airport)
      expect{@plane.take_off(@airport)}.to raise_error("Can't take off in stormy conditions!")
    end
  end
end
