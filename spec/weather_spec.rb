require 'weather'

describe Weather do
  # tests that class responds to method which generates random weather
  it { is_expected.to respond_to(:randomize).with(1).argument }

  it 'tests that #randomize returns false when weighted to be sunny' do
    expect(subject.randomize(100)).to eq(false)
  end

  it 'tests that #randomize returns true when weighted to be stormy' do
    expect(subject.randomize(0)).to eq(false)
  end
  
end
