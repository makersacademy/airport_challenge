require 'airport'

describe Airport do
  let(:plane) { double :plane }

  it 'responds to take_off method' do
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  describe '#land', :land do
    it 'returns an array containing a plane' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

end
