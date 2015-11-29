require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  it { is_expected.to respond_to(:weather) }

  it 'is expected to initialize with weather set to :fine' do
    expect(weather.weather).to eq(:fine)
  end

end
