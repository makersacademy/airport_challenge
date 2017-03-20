require 'weather'

describe Weather do

  describe '#stormy?' do
    it 'should be true or false' do
      logic = [true, false]
      expect(logic).to include(Weather.stormy?)
    end
  end

end
