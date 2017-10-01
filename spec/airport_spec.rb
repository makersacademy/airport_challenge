require "airport"

describe Airport do

  describe '#takeoff' do

    it 'allows an airport to let a plane takeoff' do
      plane = Plane.new
      subject.land(plane)
    expect(subject.takeoff(plane)).to eq plane
    end

  it 'has the takeoff method receive a plane as argument' do
  expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it 'removes the plane from the airport when it takesoff' do
    plane = Plane.new
    plane1 = Plane.new
    subject.land(plane)
    subject.land(plane1)
    subject.takeoff(plane)
    expect(subject.instance_variable_get(:@planes)).not_to include(plane)
  end

end

  describe '#land' do

      it 'has the land method receive a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'raises an error when airport is full' do
    (subject.instance_variable_get(:@capacity)).times {subject.land(Plane.new)}
    expect {subject.land(Plane.new)}.to raise_error "Airport full"
    end
  end

  describe '#confirm_if_plane_in_airport' do

      it 'confirms if a plane is in an airport with one argument' do
      expect(subject).to respond_to(:confirm_if_plane_in_airport).with(1).argument
    end

#     it 'Confirms that a plane is in the airport' do
#       plane = Plane.new
#       subject.land(plane)
#     expect(subject.confirm_if_plane_in_airport(plane)).to eq "#{plane} is in the airport"
#   end
#
  it 'Confirms that a plane is not in the airport' do
    plane = Plane.new
  expect(subject.confirm_if_plane_in_airport(plane)).to eq "#{plane} is not in the airport"
end

  end

    describe '#storms?' do
      it 'responds to storms?' do
      expect(subject).to respond_to :storms?
      end
    end

    it 'responds to planes' do
    expect(subject).to respond_to :planes
    end

end
