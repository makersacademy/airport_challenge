require 'airport'

describe Airport do

  it 'commands a plane to land' do
    heathrow = Airport.new
    ba = Plane.new
    heathrow.land(ba)
    expect(heathrow).to respond_to(:land).with(1).argument
  end

  it 'commands a plane to take off' do
    heathrow = Airport.new
    ba = Plane.new
    heathrow.take_off(ba)
    expect(heathrow).to respond_to(:take_off).with(1).argument
  end

  it 'prevents plane landing when airport is at capacity' do
    heathrow = Airport.new
    ba = Plane.new
    10.times do
      heathrow.land(ba)
    end

    expect(heathrow.at_capacity).to eq("Please wait we are at max capacity")
  end

  # it 'prevents plane landing when weather is stormy' do
  #   heathrow = Airport.new
  #   ba = Plane.new
  #   expect(ba).to receive(:weather).and_return(:stormy)
  # end

  
end