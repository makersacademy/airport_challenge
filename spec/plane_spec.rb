require 'plane'
describe Plane do

  describe "#land_at" do
    it 'responds to land_at method' do
      expect(Plane.new).to respond_to(:land_at).with(1).arguments
    end
  end

  describe "#take_off" do
    it 'respond to take_off method' do
      expect(Plane.new).to respond_to(:take_off).with(1).arguments
    end
  end

  it 'removes a plane from the airport' do
    plane, airport = Plane.new, Airport.new
    plane.land_at(airport)
    plane.take_off(airport)
    expect(airport.planes).not_to eq plane
  end

  it 'creates a new airport' do
    expect(Airport.new).to be_a Airport
  end

end
