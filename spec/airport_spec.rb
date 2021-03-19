require 'airport'

describe 'Airport'do

   it' instructs a plane to take off when the weather is not stormy 'do
    airport = Airport.new(20, false)
    plane = Plane.new
    20.times{airport.land(plane)}
    expect(airport.take_off).to eq(19)
  end

    it' instructs a plane to not take off when the weather is stormy 'do
    airport = Airport.new(20, true)
    airport.take_off
    expect(airport.take_off).to eq(false)
 end

 it ' prevents a plane to land when the wheather is stormy'do
  airport = Airport.new(17, true)
  plane = Plane.new
  expect{airport.land(plane)}.to raise_error " Not allowed to land stormy weather "
end

  it ' alloweds a plane to land when the wheather is not stormy'do
  airport = Airport.new(20, false)
  expect(airport).to respond_to(:land).with(1).argument
end

  # it 'confirms that theres is no longer plane in the airport' do
  # airport = Airport.new(0, false)
  # plane = Plane.new
  # expect(airport.confirm_no_plane(plane)).to eq(true)
  # end

  # it ' it confirms that there is plane in the airport' do
  #   airport = Airport.new(20, true)
  #   plane = Plane.new
  #   expect(airport.confirm_no_plane(plane)).to eq(false)
  # end

     it 'it raises an error when the airport is full capacity'do
     airport = Airport.new(21, true)
     plane = Plane.new
     expect{airport.land(plane)}.to raise_error " Full capacity "
   end

     it 'confirms that there is no longer plane in the airport'do
     airport = Airport.new(0, false)
     plane = Plane.new
     airport.land(plane)
     expect{airport.take_off}.to raise_error " There is no longer plane in the airport "
    end

 end
