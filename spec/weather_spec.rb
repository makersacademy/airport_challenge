require 'weather'

describe Weather do
  it 'can create an instance of weather' do
    weather = Weather.new
    expect(weather).to be_kind_of(Weather)
  end

  it { is_expected.to respond_to :condition }

  it 'returns a random number' do
    allow(subject).to receive(:condition) { 5 }
  end

  it 'returns a number between 1 and 10' do
    expect(subject.condition).to all(be_between(1, 10))
  end
end
