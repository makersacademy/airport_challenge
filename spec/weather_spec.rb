require 'weather'

describe Weather do 

  let(:subject) {described_class.new}

  describe "#stormy?" do
    it 'returns true when rand is greater than 0.8' do
      allow(Kernel).to receive(:rand).and_return(0.9)
      expect(subject.stormy?).to eq true
    end   
  end
end