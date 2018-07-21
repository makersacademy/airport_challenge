require 'airport'
require 'plane'
describe Airport do
  # airport = Airport.new(20)
  # plane = Plane.new
  let(:airport) {described_class.new(20)}
  # let(:plane) {Plane.new}
  let(:plane) {double :plane}
  # plane = double(:plane) can only be called within it statement or as above with a let/before do statement (memory efficient).
  describe '#land' do
    it 'instructs plane to land' do
  	   expect(airport).to respond_to(:land).with(1).argument
    end

    #use context "when" something
    context 'when at capacity' do
      it "raises an error" do
        # plane = double(:plane)  
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "cannot land plane, airport has reached capacity"
      end
    end  
  end

  describe '#take_off' do
    it "instructs plane to take_off" do
    expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
