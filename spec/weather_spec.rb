require 'weather'

describe Weather do

  describe '#stormy' do
    it 'pronounces the weather stormy at high windspeed' do
     weather = Weather.new(9)
     expect(weather).to be_stormy
   end
  end

end
