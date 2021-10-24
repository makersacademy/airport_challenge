require "atc"

describe AirTrafficControl do

  it 'initiates with an empty @planes array and an Airport in @airport' do
    expect(subject.planes).to eq []
    expect(subject.airport.class).to eq Airport
  end

  it 'can set the capacity of its airport when initialised' do
    newatc = AirTrafficControl.new(50)
    expect(newatc.airport.capacity).to eq 50
  end

  describe '#override_airport_capacity' do
    it 'updates associated airport\'s capacity to passed argument' do
      subject.override_airport_capacity(10)
      expect(subject.airport.capacity).to eq 10
    end

    it 'resets airport\'s capacity to default value if no argument passed' do
      subject.override_airport_capacity(10)
      subject.override_airport_capacity
      expect(subject.airport.capacity).to eq 20
    end
  end

  describe '#new_plane' do
    it 'adds a plane to the @planes array and returns the new plane' do
      planes_count = subject.planes.count
      expect(subject.new_plane.class).to eq Plane
      expect(planes_count < subject.planes.count).to eq true
    end
  end

  describe '#order_land' do
    it 'returns an error if a Plane is not provided in arguments' do
      expect { subject.order_land("Plane") }.to raise_error 'Call error: must include a Plane as an argument'
      expect { subject.order_land(Plane.new) }.to_not raise_error
    end

    it 'lands a plane in the associated airport if conditions are right' do
      srand(3)
      planes_count = subject.airport.hangar_count
      subject.order_land(Plane.new)
      expect(planes_count < subject.airport.hangar_count).to eq true
    end
  end

  describe '#order_launch' do
    it 'returns an error if a Plane is not provided in arguments' do
      expect { subject.order_launch("Plane") }.to raise_error 'Call error: must include a Plane as an argument'
    end

    it 'launches a plane from the associated airport if conditions are right' do
      srand(3)
      testplane = Plane.new
      planes_count = subject.airport.hangar_count
      subject.order_land(testplane)
      subject.order_launch(testplane)
      expect(planes_count == subject.airport.hangar_count).to eq true
    end
  end

end

describe '#atc_test' do
  it 'atc_test creates a new AirTrafficControl instance with 3 planes' do
    atc_test
    expect(atc.planes.count).to eq 3
    expect(atc.planes.include?(plane1)).to eq true
    expect(atc.planes.include?(plane2)).to eq true
    expect(atc.planes.include?(plane3)).to eq true
  end
end
