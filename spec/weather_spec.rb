require 'weather'

describe Weather do

  it 'is sunny when rand(20) greater than 2' do
    allow(Random).to receive(:rand).with(20){3}
    is_expected.to be_sunny
  end

  it 'is stormy when rand(20) less than 3' do
    allow(Random).to receive(:rand).with(20){2}
    is_expected.to be_stormy
  end

end