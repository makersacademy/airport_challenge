require 'airport'

describe Airport do
  let(:subject) { Airport.new } 
  let(:plane) { double :plane }

  describe "#airport" do
    it { is_expected.to respond_to :land }

    # it "should determine if a plane is at an airport" do
    # expect(airport.location(plane)).to eq false
    # end

    it "should raise an error if airport is full" do
      capacity = 35
      airport = Airport.new(capacity)
      capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport at capacity"
    end

    it 'should land a plane' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'should let a plane take-off and confirm plane no longer in hangar' do
      allow(plane).to receive :take_off
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar.include?(plane)).to eq(false)
    end
  end
end