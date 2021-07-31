require 'airport.rb'

describe Airport do
  before(:each) do
    @airport = Airport.new
  end

  it 'creates new Airport object' do
    expect(subject).to be_instance_of Airport
  end

  it 'responds to landing' do
    expect(subject).to respond_to(:landing)
  end
end
