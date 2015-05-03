describe Weather do
  it { is_expected.to respond_to :forecast }
  # it 'generates random weather' do
  #    allow(subject).to receive(:stormy?) {true}
  #    expect(subject.stormy?).to be_stormy
  #  end
end