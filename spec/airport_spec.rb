require 'airport'

describe Airport do

  describe '#initalization' do
    it 'gets a random weather on initalization' do
      expect(subject.weather == "sunny" || subject.weather == "stormy").to eq(true)
    end
  end
end
