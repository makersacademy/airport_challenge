require 'airport'

RSpec.describe do

  it 'can create a airport' do
    airport = Airport.new

    expect(airport.class).to eq(Airport)
  end

  it 'responds to #take_off' do
    airport = Airport.new

    expect(airport).to respond_to(:take_off)
  end
end