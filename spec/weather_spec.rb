describe Weather do
  it { is_expected.to respond_to :stormy? }

  it 'returns false when weather is not stormy' do
    allow(Weather).to receive(:stormy?) { false }
    expect(subject.stormy?).to eq false
  end
end
