require 'weather'

describe Weather do

  before(:each) do 
    @weather = Weather.new
  end

  describe '#stormy?' do
    it 'returns true when srand 1 is run' do
      srand 1
      expect(@weather.stormy?).to eq true
    end

    it 'returns false when srand 5 is run' do
      srand 5
      expect(@weather.stormy?).to eq false
    end
  end
end 
