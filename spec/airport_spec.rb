require 'airport.rb'

describe Airport do

  it 'should respond to land planes' do
    airport = Airport.new
    expect(airport).to respond_to :land_plane
  end


end
