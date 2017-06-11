require 'weather'

describe Weather do
  it { is_expected.to respond_to(:forecast) }

  it 'chooses valid forecasts' do
    allow(subject).to receive(:forecast)
  end
end
