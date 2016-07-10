require 'airport'

describe Airport do
  let (:plane) {double :plane}
  it {is_expected.to respond_to(:planes)}

  describe '#land' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'allow a plane to land at the airport' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'allows a plane to take off from the airport' do
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

  end

end
