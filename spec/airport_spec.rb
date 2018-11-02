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

end
