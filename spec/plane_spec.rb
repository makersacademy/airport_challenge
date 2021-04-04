require 'plane'
describe Plane do
  it { is_expected.to be_instance_of(Plane) }
  describe "#land" do
    it { expect(subject).to respond_to(:land).with(1).argument }
    it 'lands the plane' do
      subject.take_off
      expect(subject.land(Airport.new)).to be_truthy
    end
    it 'raise error when airport is full' do
      airport = Airport.new
      Plane.new.take_off.land(airport)
      expect { subject.take_off.land(airport) }.to raise_error('airport full')
    end
    it 'raise error when already on ground' do
      expect { subject.land(Airport.new) }.to raise_error('already on ground')
    end
  end
  describe "#take_off" do
    it { is_expected.to respond_to(:take_off) }
    it 'tells the plane to take off' do
      subject.take_off.land(Airport.new)
      subject.take_off
      expect(subject).to be_in_air
    end
    it 'raise error if it is already in air' do
      subject.take_off
      expect { subject.take_off }.to raise_error('plane in air')
    end
  end
end
