require 'weather'

describe Weather do
  subject(:weather) {described_class.new}
  it 'should read the weather' do
    weather = double :weather
    allow(weather).to receive(:sunny) {1..6}
    allow(weather).to receive(:stormy) {7..10}
  end

end
