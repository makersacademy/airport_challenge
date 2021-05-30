require 'airport'

describe Airport do
  subject(:airport) { described_class.new(10) }

  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end 
  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
   
  end
  it 'does not allow plane to land when airport is full' do
    10.times do 
      airport.land(:plane)
    end
    expect { airport.land(:plane).to raise_error "Plane cannot land, airport full" }
  end
end
