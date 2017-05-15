require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it { expect(weather).to respond_to :stormy? }

  it 'check weather conditions' do
    srand 8900
    expect(weather.stormy?).to eq false
  end

  it 'check weather conditions' do
    srand 1234
    expect(weather.stormy?).to eq true
  end

end
