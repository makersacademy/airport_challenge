require 'weather'

describe Weather do

  describe '#condition' do
    it 'returns number from 1 to 100' do
      expect(subject.condition.between?(1,100)).to eq true
    end
  end 
end
