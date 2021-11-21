
require 'airport'

describe Airport do
  
##   it 'responds to plane landing' do
##     expect(subject).to respond_to(:land_plane)
##   end
  # it { is_expected.to respond_to(:land).with(1).argument } # one-liner syntax
##   it 'lands a plane' do
##     plane = Plane.new
##     expect(subject.land(plane)).to eq plane
##   end
  describe '#land(plane)' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error when the airport is full' do
        plane = Plane.new
        airport = Airport.new
        subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

  it { is_expected.to respond_to :take_off } 
##   describe '#take_off' do
##     it 'plane takes off' do
##       plane = Plane.new
##       expect(subject.land(plane)).to eq plane
##     end
##   end
  it 'instructs plane to take off and confirm it is no longer at the airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
    plane = Plane.new
    # plane = subject.take_off
    expect(subject.take_off(plane)).to eq 'Plane has taken off' # be_left_airport
  end

  # it { is_expected.to respond_to :plane }
  it 'it returns landed planes' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end 
##   it 'instruct plane to land at airport' do
##     # airport = Airport.new
##     # plane = airport.land_plane
##     expect(plane).to respond_to(:land_plane)
##     subject.land_plane(plane)
##   end
end
