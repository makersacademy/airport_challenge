require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do
  let (:plane) { double :plane, flying?: true, land!: nil }
  let (:airport) { Airport.new }

  it 'should be empty when created' do
    expect(airport.planes.length).to eq 0 
  end

  it 'allows a plane to land' do
    airport.land(plane)
    expect(airport.planes.length).to eq 1
  end

  it 'the plane is notified that it has landed' do
    
  end

    # it {is_expected.to respond_to :flying?}
    # it {is_expected.to respond_to :landed_planes}
    # # it {is_expected.to respond_to :land_permission}

    # context 'allows a plane to take off' do
    #   it { is_expected.to respond_to :takeoff }
    # end

    # it 'knows when a plane is flying' do
    #   expect(subject).to respond_to :flying
    # end

    # it 'a plane can land' do
    #   # it { is_expected.to respond_to :land_permission }
    # end

    # it 'a plane cannot land if the airport is full' do
    #   airport = Airport.new
    #   (airport.capacity).times {}
    # end

>>>>>>> initial commit
end
