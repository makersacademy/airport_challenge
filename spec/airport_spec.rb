require './docs/airport_challenge'

describe Airport do
  it 'creates instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
  
  # it 'allows plane to land' do
  #   airport = Airport.new
  #   expect(airport).to respond_to :land
  # end

  it 'land takes 1 argument' do
    airport = Airport.new
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "allows a plane to takeoff from airport" do
    airport = Airport.new
    expect(airport).to respond_to(:takeoff).with(1).argument
  end 
end
