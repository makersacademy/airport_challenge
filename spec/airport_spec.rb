require 'airport'
describe Airport do
  it 'should create an instance of an airport' do
    expect(Airport.new).to be_an_instance_of(Airport)
  end
end
