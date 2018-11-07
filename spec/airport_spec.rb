#https://github.com/criszelaya24/airport_challenge
require 'airport_details'
require 'weather'

describe Airport do
	let(:check){ described_class.new }

	describe '#Initialize weather' do
			it 'creates a weather when initialized' do
			expect(check.weather).to be_a_kind_of Weather
		end
	end
	context '#Airport' do
		it 'Givin permission to land the aircraft into the airport' do
			aircraft = Airport.new
			expect(aircraft.land).to eq true
			expect(aircraft.hangar).to eq [1]
		end

		it 'Giving permission to take off the aircraft into the airport' do
			aircraft = Airport.new
			aircraft.land
			expect(aircraft.take_off).to eq true
			expect(aircraft.hangar).to be_empty
		end

		# it 'Canceling the land permission of the aircraft because of the weather' do
		# 	aircraft = Airport.new
		# 	allow(check).to receive(:stormy?).and_return(true)
		# 	expect(check.stormy?).to be(true)
		# 	expect{aircraft.land}.to raise_error('You can not land the aircraft because of the storm')
		# end

		it 'Raising an error when the airport is full and some aircraft is trying to land' do
			aircraft = Airport.new
			Airport::DEFAULT_CAPACITY.times{ aircraft.land}
			expect{aircraft.land}.to raise_error('You can not land the aircraft because the airport is full')
		end

		it 'Raising an error when the airport (Hangar) is empty and some aircraft is trying to take off' do
			aircraft = Airport.new
			expect{aircraft.take_off}.to raise_error('You can not take off the aircraft because is emty')
		end
	end
end