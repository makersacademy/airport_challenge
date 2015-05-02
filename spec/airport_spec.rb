require 'airport'
require 'plane'
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
	let(:plane) { Plane.new }

	context 'taking off and landing' do
		it { is_expected.to respond_to(:land).with(1).argument }
		it { is_expected.to respond_to(:take_off).with(1).argument }

		it 'a plane can land' do
		subject.land(plane)
		expect(plane).to be_landed
		end

		it 'a plane can take off' do
			subject.land(plane)
			subject.take_off(plane)
			expect(plane).to be_flying
		end

	it 'a plane cannot land if the airport is full' do
	end


end


#   context 'traffic control' do

#     xit 'a plane cannot land if the airport is full'

#     # Include a weather condition.
#     # The weather must be random and only have two states "sunny" or "stormy".
#     # Try and take off a plane, but if the weather is stormy,
#     # the plane can not take off and must remain in the airport.
#     #
#     # This will require stubbing to stop the random return of the weather.
#     # If the airport has a weather condition of stormy,
#     # the plane can not land, and must not be in the airport

#     context 'weather conditions' do
#       xit 'a plane cannot take off when there is a storm brewing'

#       xit 'a plane cannot land in the middle of a storm'
#     end
#   end
end
