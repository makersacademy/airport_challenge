require 'airport'

describe Airport do

  let(:plane) {double :plane}

  describe '#land' do

    it {is_expected.to respond_to(:land).with(1).argument}

    it "lands plane" do
      expect(subject.land(plane)).to eq [plane]
    end

  end

  describe '#take_off' do

    it {is_expected.to respond_to(:take_off).with(1).argument}

    it 'instructs plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'plane no longer at airport after take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

  end

end
