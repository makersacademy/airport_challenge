require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :land}

  describe '#land(plane)' do
    let (:plane) { double :plane}
    it 'lands planes' do
      plane = double :plane
      allow(plane).to receive(:landed?).and_return(true)
      subject.land(plane)
    end

  end
end
