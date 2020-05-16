require 'airport'

describe Airport do
  it 'creates an instance of the class Airport' do
    expect(Airport.new).to be_instance_of Airport
  end
end
