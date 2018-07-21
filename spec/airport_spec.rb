require 'airport'
require 'plane'
describe Airport do
  # airport = Airport.new(20)
  # plane = Plane.new
  let(:airport) {described_class.new(20)}
  let(:plane) {Plane.new}
  describe '#land' do
    it 'instructs plane to land' do
  	   expect(airport).to respond_to(:land).with(1).argument
    end
    it "cannot land plane when aiport at capacity" do
      20.times do
        airport.land(:plane)
      end
      expect { airport.land(:plane) }.to raise_error "cannot land plane, airport has reached capacity"
    end
  end

  describe '#take_off' do
    it "instructs plane to take_off" do
    expect(airport).to respond_to(:take_off).with(1).argument
    end
    

  end
end
