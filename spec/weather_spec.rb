require 'weather'

describe Weather do

  it { is_expected.to respond_to(:randomize).with(1).argument }

  it 'tests that #randomize returns false when weighted to be sunny' do
    expect(subject.randomize(100)).to eq(false)
  end

  it 'tests that #randomize returns true when weighted to be stormy' do
    expect(subject.randomize(0)).to eq(false)
  end

  it 'tests that rand returns a decimal place number' do
    expect(Kernel.rand).to be_an_instance_of Float
  end

end
