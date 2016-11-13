require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  it 'should test to get a result of stormy' do
    allow(Kernel).to receive(:rand).and_return 20
    expect(weather.stormy?).to be true
  end

  it 'should test to get a result of sunnny' do
    allow(Kernel).to receive(:rand).and_return 1
    expect(weather.stormy?).to be false
  end

end
