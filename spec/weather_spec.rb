require 'weather'

describe Weather do
  it 'Generates normal weather' do
    allow(subject).to receive(:rand).and_return(2)
    expect(subject.stormy?).to eq false
  end

  it 'Generates stormy weather' do
    allow(subject).to receive(:rand).and_return(4)
    expect(subject.stormy?).to eq true
  end
end
