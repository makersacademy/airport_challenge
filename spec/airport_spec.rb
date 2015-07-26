require 'airport'

describe Airport do

  let(:flying_plane){ double :flying_plane, flying?: :true, landed?: false }
  let(:landed_plane){ double :landed_plane, landed?: true, flying?: false }

  context 'when it is created' do 
    it 'has a traffic controller' do 
      expect(subject.traffic_controller).to be_a TrafficController
    end

    it 'has weather that is sunny' do 
      expect(subject.weather).to eq "Glorious Sunshine"
    end

    it 'has a capacity of 5 planes' do 
      expect(subject.capacity).to be 5
    end
  end

  it 'can receive a plane' do 
    plane = Plane.new(subject)
    plane.pilot.request_to_land(subject)
    plane.pilot.land_plane(subject)

    expect(subject.planes.include?(plane)).to be true
  end

  it 'can be full' do 
    5.times do 
      plane = Plane.new(subject)
      plane.pilot.request_to_land(subject)
      plane.pilot.land_plane(subject)
    end

    expect(subject.full?).to be true
  end

  describe 'take off' do
    it 'instructs a plane to take off'

    xit 'releases a plane'
  end

  describe '#land_plane' do

    # it 'receives a plane' do 
    #   plane = Plane.new(subject)
    #   subject.land_plane(plane)
    #   expect(subject.planes.include?(plane)).to eq true
    # end

    # it "only receives the plane if it matches the plane's destination" do 
    #   airport2 = Airport.new
    #   plane = Plane.new(airport2)

    #   expect{subject.land_plane(plane)}.to raise_error "That plane isn't headed for here!"
    # end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      xit 'does not allow a plane to land'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
