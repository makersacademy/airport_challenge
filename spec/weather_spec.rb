require 'weather'

describe Weather do
   describe 'stormy?' do
    it 'responds to the method' do
    expect(Weather.stormy?).to eq true
      end
   end
end
