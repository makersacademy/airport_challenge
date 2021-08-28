require './docs/plane'

describe Plane do 

  it 'Should land at the airport' do
    plane = Plane.new
    plane.land
    expect(plane.land).to eq("The plane has landed at the airort")
  end 

  it 'Should take off from the airport' do
    plane = Plane.new 
    plane.take_off 
    # expect(plane.take_off
  end 


end 
