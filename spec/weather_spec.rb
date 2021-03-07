require 'airport'

describe Weather do
  it { is_expected.to respond_to :forecast }

  it 'is stormy is the number is odd' do
    allow(subject).to receive(:rand).and_return(5)
    expect(subject.forecast).to eq "stormy"
  end

  it 'is sunny is the number is even' do
    allow(subject).to receive(:rand).and_return(4)
    expect(subject.forecast).to eq "sunny"
  end

end
