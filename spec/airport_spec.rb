require 'airport'

describe Airport do
  describe '#planes' do
    it { is_expected.to respond_to :planes }

    it 'is empty by deafult' do
      expect(subject.planes.count).to eq 0
    end
  end
end
