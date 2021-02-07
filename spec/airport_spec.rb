require 'airport.rb'

describe Airport do

  it { is_expected.to respond_to :empty? }

  describe 'Landing' do
    it { is_expected.to respond_to :land }
  end

  describe 'Takeoff' do
    it { is_expected.to respond_to :takeoff }
  end
    
end