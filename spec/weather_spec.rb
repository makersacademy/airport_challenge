require 'weather'

describe Weather do
  it 'is telling what is the weather' do
    expect(subject).to receive(:rand).and_return(Weather::STORMY)
    expect(subject.forecast).to eq Weather::STORMY
  end
end
