require 'airport'

describe Airport do
  # mock an instance of the Plane class each time it's needed
  let(:plane) { instance_double(Plane) }

  context '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'can land a plane' do
      expect(subject.land(plane)).to eq [plane]
    end

    it "raises an error if you try to land a plane that's already landed" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'That plane has already landed.'
    end

    it 'returns parked planes in the hangar' do
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end
  end

  context '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "can allow planes to take off and confirms that it's left the hangar" do
      # put a plane in the hangar first
      subject.land(plane)
      # when the plane takes off, we want to see whats in the hangar? or we want to see error?
      expect(subject.take_off(plane)).to eq []
    end

    it 'only allows planes that are at that airport to take off' do
      expect { subject.take_off(plane) }.to raise_error 'That plane is not here.'
    end

  end

end
