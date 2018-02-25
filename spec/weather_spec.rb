require 'weather'

describe Weather do

  describe ':generate' do
    it 'generates weather' do
      expect(subject.current).to eq(:stormy).or(eq(:sunny))
    end
  end
end
