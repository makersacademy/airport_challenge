describe Weather do
  it { is_expected.to respond_to :forcast }

  describe '#forcast' do
    subject { described_class.new.forcast }
    # it ''
  end
end
