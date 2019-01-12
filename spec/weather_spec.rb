require 'weather'

describe Weather do
  it 'Generates weather' do
    expect(subject).to receive(:rand).and_return(2)
    expect(subject.stormy?).to eq false
  end
end
