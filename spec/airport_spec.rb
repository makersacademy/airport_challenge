require "airport.rb"
require "plane.rb"
describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  describe '#land_plane(plane)' do
    it "should allow the user to set capacity for the airport" do
      expect(subject.land_plane(plane)).to eq plane
    end
  end

  describe '#take_off(plane)' do
    it "should be able to tell plane to take off" do
      expect(subject.take_off(plane)).to eq subject.planes_at_airport
    end

    it "should be able to pervent take off if weather is stormy" do
      allow(subject).to receive(:weather).and_return(@weather = 'Stormy')
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error('Cannot take off weather is Stormy')
    end
  end
end
