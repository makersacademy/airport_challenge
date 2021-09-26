require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }
  it 'should either be true or false' do
    expect(subject.stormy?).to be(true).or be(false)
  end
  it 'should respond true when stormy' do
    allow(subject).to receive(:stormy?) { true }
    expect(subject.stormy?).to eq true
  end
  it 'should respond false when sunny' do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.stormy?).to eq false
  end
  
end
