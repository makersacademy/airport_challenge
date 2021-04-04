require 'plane'
describe Plane do
  it { is_expected.to be_instance_of(Plane) }
  describe "#land" do
    it { expect(subject).to respond_to(:land).with(1).argument }
    it 'returns the airport object where the plane lands' do
      expect(subject.land(Airport.new)).to eq(subject)
    end
    it 'raise error when airport is full' do
      airport = Airport.new
      Plane.new.land(airport)
      p airport.hanger
      p airport.capacity
      expect { subject.land(airport) }.to raise_error('airport full')
    end
  end
  describe "#take_off" do
    it { is_expected.to respond_to(:take_off) }
    it 'tells the plane to take off' do
      subject.land(Airport.new)
      subject.take_off
      expect(subject).to be_in_air
    end
  end
end
