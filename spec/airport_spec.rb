require 'airport'

describe Airport do

  it 'creates an instance of Airport' do
  my_airport = Airport.new
  expect(my_airport).to be_instance_of Airport
  end

end
