require 'weather'

describe Weather do
  it { is_expected.to respond_to(:forecast) }
  it 'can give a forecast of sunny weather' do
    allow(subject).to receive(:forecast) { "sunny" }
  end
  it 'can give a forecast of stormy weather' do
    allow(subject).to receive(:forecast) { "stormy" }
  end
end
