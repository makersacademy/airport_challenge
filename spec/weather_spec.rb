require 'weather'
describe Weather do
  it { is_expected.to respond_to :stormy? }
  it 'returns stormy weather' do
    allow(subject).to receive(:stormy?).and_return true
  end
  it 'returns sunny weather' do
    allow(subject).to receive(:stormy?).and_return false
  end
end
