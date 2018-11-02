require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  describe '#hangar' do

    it { expect(subject).to respond_to(:hangar) }

  end

  describe '#takeoff' do

    it 'a can make a plane in its hangar take off' do
      subject.hangar << plane
      subject.takeoff(plane)
      expect(subject.hangar).to eq([])
    end

  end

end
