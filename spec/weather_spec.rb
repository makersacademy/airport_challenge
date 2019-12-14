require 'weather'

describe Weather do
  it 'Should generate a random number' do
    expect(subject.weather).to be_a(Integer).and be < 10
  end
  
  it { is_expected.to respond_to(:stormy?) }
  
  it 'Should be stormy if the random number is <= 3' do
    subject.weather = 3
    expect(subject).to be_stormy
  end

  it 'Should not be stormy if the random number is >= 4' do
    subject.weather = 4
    expect(subject).not_to be_stormy
  end
end
