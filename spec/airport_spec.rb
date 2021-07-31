require 'airport'

describe Airport do
  before do 
    @heathrow = Airport.new
    @stansted = Airport.new(1)
    @spitfire = Plane.new
    @hurricane = Plane.new
    @heathrow.land(@spitfire)
  end

  it 'is able to instruct a plane to land' do
    expect(@heathrow).to respond_to :land
    expect(@spitfire.airborne?).to eq false
  end
  
  it 'is able to instruct a plane to take off' do
    expect(@heathrow).to respond_to :take_off
    @heathrow.take_off(@spitfire)
    expect(@spitfire.airborne?).to eq true
  end
  
  it 'stops a landed plane from landing again' do
    expect { @heathrow.land(@spitfire) }.to raise_error "That plane has already landed!"
  end
  
  it 'stops an airborne plane from taking off again' do
    @heathrow.take_off(@spitfire)
    expect { @heathrow.take_off(@spitfire) }.to raise_error "That plane has already taken off!"
  end
  
  it 'makes sure a plane is at the airport before taking off' do
    expect { @stansted.take_off(@spitfire) }.to raise_error "That plane is not at this airport!"
  end
  
  it 'checks a plane cannot land at an airport at full capacity' do
    @heathrow.take_off(@spitfire)
    @stansted.land(@spitfire)
    expect { @stansted.land(@hurricane) }.to raise_error "Unable to land airport is full!"
  end
  
  it 'is able to check if the weather is stormy' do
    expect(@heathrow).to respond_to :stormy?
  end
  
end
