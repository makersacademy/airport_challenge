require 'airport'

describe Airport do

  describe '#capacity' do

    it 'should show attr_reader ongound' do
      expect(subject).to respond_to(:onground)
    end

    it 'should show the capactiy' do
      expect(subject).to respond_to(:capacity)
    end

    it 'the default should be 20' do
      expect(subject.capacity).to eq 20
    end

    it { is_expected.to respond_to(:inair) }

  end

end
