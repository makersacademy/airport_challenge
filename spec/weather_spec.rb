describe Weather do
  it 'can be stormy' do
    allow(subject).to receive(:stormy?) { true }
    expect(subject).to be_stormy
  end
end