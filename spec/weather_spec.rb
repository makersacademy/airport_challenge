require 'weather'

describe Weather do
  it 'should read the weather' do
    weather = double :weather
    allow(weather).to receive(:sunny) {1}
    allow(weather).to receive(:stormy) {0}
  end

end
