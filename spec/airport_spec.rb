require 'airport'

describe Airport do
  let(:plane) {double(:Plane, land: nil, take_off: nil)}

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'lands a plane' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#plane' do
    it {is_expected.to respond_to(:planes)}

    it 'shows all planes that have landed' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#take_off' do
    it{is_expected.to respond_to(:take_off).with(1).argument}

    it 'instructs a plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to be_empty
    end

    it 'calls the plane.take_off method' do
    expect(plane).to receive(:take_off)
    subject.take_off(plane)
    end
  end
end
