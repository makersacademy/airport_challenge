require 'airport'

describe Airport do

  describe '#accept' do

    let(:plane) { double :plane, dock: nil, landed?: true }
    it 'accepts an plane' do
      subject.accept(plane)
      expect(subject.planes).to eq [plane]
      expect(plane).to be_landed
    end

  end

end
