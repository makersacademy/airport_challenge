require 'airport'
require 'plane'

describe Airport do
  before(:each) do 
    @airport = Airport.new
  end

  it 'should have a non-negative capacity' do
    expect(@airport.capacity).to be > 0
  end

  it { is_expected.to have_attributes(:planes => []) }
end