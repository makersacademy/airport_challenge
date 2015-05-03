describe Weather do
  it { is_expected.to respond_to :forecast }

  it 'can be stormy' do
    allow(subject).to receive(:forecast) { 3 }
    subject.forecast
    expect(subject.stormy?).to be_stormy
  end
end