require 'weather'

describe Weather do

  describe '#forecast' do
    it { is_expected.to respond_to :forecast }

    it "should randomly return 'Clear' or 'Stormy'" do
      expect(subject.forecast).to eq('Clear').or eq('Stormy')
    end

    it "returns 'Stormy' when randomness is less than 10" do
      allow(Kernel).to receive(:rand).and_return 7
      expect(subject.forecast).to eq('Stormy')
    end

    it "returns 'Clear' when randomness is more than 10" do
      allow(Kernel).to receive(:rand).and_return 67
      expect(subject.forecast).to eq('Clear')
    end
  end
end
