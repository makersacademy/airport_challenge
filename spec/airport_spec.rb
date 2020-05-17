require 'airport'

describe Airport do
  let(:subject) { Airport.new } 
  let(:plane) { double :plane }

  describe "#airport" do
    it { is_expected.to respond_to :land }

    it 'should allow air traffic controller to set capacity' do 
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should raise an error if airport is full" do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport at capacity"
    end

    it 'should land a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should let a plane take-off and confirm plane no longer in hangar' do
      allow(plane).to receive :take_off
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar.include?(plane)).to eq(false)
    end
  end
end