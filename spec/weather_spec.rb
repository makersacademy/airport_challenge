require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it { expect(subject).to respond_to :stormy? }

  it 'check weather conditions' do
    srand 8900
    expect(subject.stormy?).to eq false
  end

end
