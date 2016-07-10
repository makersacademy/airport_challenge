require 'airport'
require 'plane'
require 'weather'

describe Airport do
it {is_expected.to respond_to :land}
it {is_expected.to respond_to(:land).with(2).argument }
it 'instructs a plane to land and airport confirms landing' do
plane = Plane.new
expect(subject.land plane).to eq "The plane #{plane} has landed"
end


it {is_expected.to respond_to :take_off}
it {is_expected.to respond_to(:take_off).with(2).argument}
it 'instructs a plane to take off and confirms it' do
plane = Plane.new
subject.land plane
weather = double()
allow(weather).to receive(:stormy?).and_return(false)
expect(subject.take_off plane).to eq "The plane #{plane} has taken off"
end

it 'when a plane took off from airport it confirms that plane is no longer in airport' do
plane = Plane.new
subject.land plane
weather = double()
allow(weather).to receive(:stormy?).and_return(false)
subject.take_off plane
expect(subject.planes.map{|x| x if x == plane}.empty?).to be true
end

it 'prevents take off if weather is stormy' do
 plane = double()
 subject.land(plane)
 weather = double()
 allow(weather).to receive(:stormy?).and_return(true)
 expect{subject.take_off plane, weather}.to raise_error('Weather condition is bad, no take offs')
 end

end
