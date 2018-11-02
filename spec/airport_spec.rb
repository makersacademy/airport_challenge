require 'airport.rb'

describe Airport do
  it 'checks that the airport class exists' do
    expect(Airport.new).to be_instance_of Airport
  end
end
