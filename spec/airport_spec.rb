require './lib/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  
  describe '#land' do
  end

  describe '#takeoff' do
  end  
end