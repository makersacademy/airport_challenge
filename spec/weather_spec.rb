require 'weather'

describe Weather do

  describe '#stormy?' do
    it 'returns true or false' do
      output = [true,false]
      expect(output).to include Weather.stormy?
    end
  end
end
