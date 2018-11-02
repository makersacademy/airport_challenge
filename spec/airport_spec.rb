require 'airport'

describe Airport do

  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  describe '#hangar' do

    it { expect(subject).to respond_to(:hangar) }

  end

  describe '#plane_in_hangar' do

    it 'returns false if plane is not in hangar' do
      expect(subject.plane_in_hangar?(plane)).to eq(false)
    end

    it 'returns true if plane is in hangar' do
      subject.hangar << plane
      expect(subject.plane_in_hangar?(plane)).to eq(true)
    end

  end

  describe '#hangar_full?' do

    it 'returns false if hangar is not full' do
      expect(subject.hangar_full?).to eq(false)
    end

    it 'returns true if hangar is at capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.hangar << plane }
      expect(subject.hangar_full?).to eq(true)
    end

  end

end
