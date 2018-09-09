require 'weather'

describe Weather do
  it { should respond_to(:stormy?) }
  it 'should return false when chance < 0.9' do
    allow(subject).to receive(:chance) { 0.8 }
    expect(subject.stormy?).to eq false
  end
  it 'should return true when chance => 0.9' do
    allow(subject).to receive(:chance) { 0.9 }
    expect(subject.stormy?).to eq true
  end
  it { should respond_to(:chance) }
end
