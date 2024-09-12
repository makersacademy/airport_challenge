require 'weather'
describe Weather do
  it 'is not stormy when random number =/= 1' do
    allow(subject).to receive(:rand).and_return(2)
    expect(subject.stormy?).to eq false
  end
  it 'is stormy when random number = 1' do
    allow(subject).to receive(:rand).and_return(1)
    expect(subject.stormy?).to eq true
  end
end
