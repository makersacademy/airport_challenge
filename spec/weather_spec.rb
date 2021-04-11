require 'weather'

  describe Weather do
    it 'outputs calm weather' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(subject.condition).to eq 'calm'
    end
    it 'outputs stormy weather' do
      allow(Kernel).to receive(:rand).and_return(8)
      expect(subject.condition).to eq 'stormy'
    end
  end
