
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
  it 'has left airport' do
    plane = subject.take_off
    expect(plane).to be_left_airport
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


# it 'can respond to plane' do
#     airport = Airport.new
#     plane = Plane.new
#     expect(airport).to respond_to(:plane)
#   end

#   it 'should land a plane' do
#     # airport = Airport.new
#     plane = Plane.new
#     subject.land(plane)
#     expect(subject.land(plane)).to eq(plane) # .with(1).argument
#   end