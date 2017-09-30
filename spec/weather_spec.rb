require './lib/weather'

describe Weather do

  context '#forecast' do
    it 'should return a Symbol' do
      expect(subject.forecast.class).to eq Symbol
    end

    it 'should return :sunny or :stormy' do
      expect(subject.forecast).to eq(:sunny).or(eq(:stormy))
    end
  end
end
