require 'airport'

describe Airport do
  it 'allows a plane to land' do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  it 'allows a plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).arguments
    expect(Plane.new.departed).to eq true 

  end

  # it 'checks the capacity of the airport' do
  #   airport = Airport.new(10)
  #   expect(airport.capacity).to be < 10
  # end

  it 'returns error if the airport is full' do
    airport = Airport.new(10)
    10.times { airport.land(Plane.new) }
    expect {airport.land(Plane.new)}.to raise_error 'airport is full'
  end

  it 'has a default airport capacity' do
    airport = Airport.new
    expect(airport.capacity).to eq 50
  end
end


# describe Airport do
# #   it { is_expected.to respond_to :took_off }
#   it { is_expected.to respond_to :permission_to_land }
# end

