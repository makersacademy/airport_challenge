require_relative '../lib/airport.rb'

describe Airport do
  it 'Checks that an Airport is actually an instance of the Airport class' do
    airport = Airport.new
    expect( airport).to be_kind_of(Airport)
  end
end