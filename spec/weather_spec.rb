require 'weather'

describe Weather do 

  subject(:weather) { described_class.new }

  it 'can be sunny' do
    allow(weather).to receive(:number).and_return 1
    expect(weather.stormy?).to be false
    expect(weather.sunny?).to be true
  end

  it 'can be stormy' do
    allow(weather).to receive(:number).and_return 5
    expect(weather.stormy?).to be true
    expect(weather.sunny?).to be false
  end
end