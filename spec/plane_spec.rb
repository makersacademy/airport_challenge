require 'plane'
describe Plane do
  it { is_expected.to be_instance_of(Plane) }
  describe "#land" do
    it { expect(subject).to respond_to(:land).with(1).argument }
    it 'returns the airport object where the plane lands' do
      airport = Airport.new
      expect(subject.land(airport)).to eq(airport) 
    end
  end
end
