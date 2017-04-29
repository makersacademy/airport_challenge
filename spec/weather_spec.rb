require 'weather'

describe Weather do

  describe '#condition' do
    it { is_expected.to respond_to :condition }

    it 'should set weather condition depending on rand number' do
      expect(subject.condition).to eq(:sunny).or(eq(:stormy))
    end
  end
end
