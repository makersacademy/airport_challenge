require 'weather'

describe Weather do
  let(:weather) { described_class.new}

  it 'can be stormy' do
    allow(Kernel).to receive(:rand).and_return 10
    expect(weather.stormy?).to be true
  end
  
end