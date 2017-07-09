require './lib/weather.rb'

describe Weather do
  subject(:weather) { described_class.new }

  it 'generates storm' do
    allow(weather).to receive(:stormy).and_return true
  end

  it 'does not generate storm' do
    allow(weather).to receive(:stormy).and_return false
  end

end
