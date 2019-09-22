require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  it 'can be stormy' do
    allow(weather).to receive(:rand).and_return(8)
    expect(weather.stormy?).to eq true
  end

  it 'can be normal' do
    allow(weather).to receive(:rand).and_return(4)
    expect(weather.stormy?).to eq false
  end

end
