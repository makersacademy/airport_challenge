require 'airport'

describe Airport do

  let (:plane) {Plane.new}
  #allow(subject).to receive_messages(:check_weather => "sunny")

  describe '#land_plane' do
    before do
      allow(subject).to receive_messages(:check_weather => "sunny")
    end
    it 'lands plane when there is space' do
      expect(subject.land_plane(plane)).to eq "#{plane} landed"
    end
    it "raises 'no space' error when airport is full" do
      (subject.airport_capacity).times {subject.land_plane(plane)}
      expect {subject.land_plane(plane)}.to raise_error("no space")
    end
    it "stores the plane in the landed_planes array after landing" do
      subject.land_plane(plane)
      expect(subject.landed_planes).to include(plane)
   end 
   it 'doesnt allow plane to land if the weather is stormy' do
    another_airport = Airport.new
    allow(another_airport).to receive_messages(:check_weather => "stormy")
    expect {another_airport.land_plane(plane)}.to raise_error("too stormy to land")
  end
  end

  describe '#take_off' do
    before do
      allow(subject).to receive_messages(:check_weather => "sunny")
    end
    it 'allows take off if plane is landed at airport' do
      subject.land_plane(plane)
      expect(subject.take_off(plane)).to eq "#{plane} takes off"
    end
    it 'raises error if plane is not landed at airport' do
      expect {subject.take_off(plane)}.to raise_error("plane not at airport")
    end
    it 'doesnt show the plane in @landed_planes after plane has taken off' do
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(subject.landed_planes).not_to include(plane)
    end 
    it 'doesnt allow take off if the weather is stormy' do
      #another_airport = Airport.new
      allow(subject).to receive_messages(:check_weather => "stormy")
      expect {subject.take_off(plane)}.to raise_error("too stormy to take off")
    end
  end

  describe '@airport_capacity' do
    it 'is set to DEFAULT_CAPACITY (5) if no capacity specified' do
      another_airport = Airport.new
      expect(another_airport.airport_capacity).to eq(5)
    end
    it 'is set to passed value' do
      another_airport = Airport.new(10)
      expect(another_airport.airport_capacity).to eq(10)
    end
  end

end