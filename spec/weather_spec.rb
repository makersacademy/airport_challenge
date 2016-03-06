require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it 'reports true if inclement' do
    allow(weather).to receive(:inclement?).and_return(true)
    expect(weather.inclement?).to eq true
  end

  it 'reports false if clear' do
    allow(weather).to receive(:inclement?).and_return(false)
    expect(weather.inclement?).to eq false
  end
end
