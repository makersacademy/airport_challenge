require 'weather'

describe Weather do
  describe '#weather' do
    context 'when rand generates a number < 8' do
      it "returns 'sunny' for rand of 0" do
        allow(subject).to receive(:rand).and_return(0)
        expect(subject.weather).to eq('sunny')
      end

      it "returns 'sunny' for rand of 3" do
        allow(subject).to receive(:rand).and_return(3)
        expect(subject.weather).to eq('sunny')
      end

      it "returns 'sunny' for rand of 7" do
        allow(subject).to receive(:rand).and_return(7)
        expect(subject.weather).to eq('sunny')
      end
    end

    context 'when rand generates a number >= 8' do
      it "returns 'stormy' for rand of 8" do
        allow(subject).to receive(:rand).and_return(8)
        expect(subject.weather).to eq('stormy')
      end

      it "returns 'stormy' for rand of 9" do
        allow(subject).to receive(:rand).and_return(9)
        expect(subject.weather).to eq('stormy')
      end
    end
  end

end