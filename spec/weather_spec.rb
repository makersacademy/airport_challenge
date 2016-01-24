require 'weather'

describe Weather do

  it 'should return true when stormy' do
    allow(subject).to receive(:random).and_return(3)
    expect(subject.stormy?).to be true
  end

  it 'should return false when not stormy' do
    allow(subject).to receive(:random).and_return(1)
    expect(subject.stormy?).to be false
  end

end
