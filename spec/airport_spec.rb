require 'airport'

describe Airport do
let(:weather) {double:weather}
 let(:plane) {double :plane}
  describe '#land' do
    it {is_expected.to respond_to(:land).with(2).arguments}

    it 'raises an error for landing when weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect{subject.land(plane, weather)}. to raise_error("Stormy weather - plane may not land")
    end

    it 'allows landing when weather is sunny' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect{subject.land(plane, weather)}.to raise_error("The plane has landed at the airport")
      # expect(subject.land(plane)).to eq plane
    end
    #
    # it 'plane lands' do
    #   expect(subject.land(plane)).to eq plane
    # end
  end

  describe '#take_off' do
    it {is_expected.to respond_to(:take_off).with(2).arguments}

    it 'raises an error for take_off when weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect{subject.take_off(plane, weather)}. to raise_error("Stormy weather - no take off allowed")
    end

    it 'allows take off when weather is sunny' do
      allow(weather).to receive(:stormy?).and_return(false)
      expect{subject.take_off(plane, weather)}.to raise_error("The plane has successfully left the airport")
    end
  end
end
