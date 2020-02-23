require 'weather'

describe Weather do
  
  describe "#stormy?" do
    it "is a boolean" do
      expect(subject.stormy?).to match(boolean)
    end

    context 'weather is good' do
      it 'returns false' do 
        allow(subject).to receive(:stormy?) { false }
        expect(subject).not_to be_stormy
      end
    end

    context 'weather is bad' do
      it 'returns true' do 
        allow(subject).to receive(:stormy?) { true }
        expect(subject).to be_stormy
      end
    end
  end

end
