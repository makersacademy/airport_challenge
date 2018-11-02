require 'airport'

describe 'Plane' do

  let(:plane) {Plane.new}

  it 'can creates a plane' do
    expect(plane).to be_instance_of(Plane)
  end

  it 'can respond to #lands' do
    expect(plane).to respond_to(:land)
  end

  it 'can land and conmfirms the plane has landed' do
    expect(plane.land).to eq "Safely landed"
  end

  it 'can respond to #take_off' do
    expect(plane).to respond_to(:take_off)
  end

  it 'confirms plane not at aiport using #take_off' do
    expect(plane.take_off).to eq "Plane is no longer at the airport"
  end
  # it 'Will not allow #take_off to run if weather is stormy' do
  #   expect {plane.take_off}.to raise_error("Take off not possible too stormy")
  # end

end

describe 'Airport' do
  it 'can create an airport' do
    expect(Airport.new).to be_instance_of(Airport)
  end
end
