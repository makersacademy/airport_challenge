require 'weather'

describe Weather do

  it { is_expected.to respond_to(:stormy?)}

  describe '#stormy?' do
    it "is equal to false" do
      weather = Weather.new
      expect(weather.stormy?).to eq false
    end
  end



end