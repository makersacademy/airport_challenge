require './lib/weather.rb'

describe Weather do

  describe '#stormy' do
    expect(subject.stormy).to eq "stormy"
  end
end
