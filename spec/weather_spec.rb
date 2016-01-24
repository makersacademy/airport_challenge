require 'weather'

describe Weather do
  subject(:Weather) {described_class.new}

  it 'can be stormy' do
    allow(subject).to receive(:rand).and_return(78)
    expect(subject.stormy?).to eq true
  end

  it 'can be non-stormy' do
    allow(subject).to receive(:rand).and_return(3)
    expect(subject.stormy?).to eq false
  end
end
