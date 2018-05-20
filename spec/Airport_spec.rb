require 'Airport'
describe Airport do
	let (:m_plane) { instance_double('Plane') }
	it '#land_a' do
		#act
		subject.land_a(m_plane)
		
		#assert
		expect(subject).to respond_to(:land_a)
		expect(subject.planes.last).to eq m_plane

	end

	it '#fall?' do
		Airport::DEFAULT_CAPACITY.times do
			subject.land_a(m_plane)
		end

		expect(subject.full?).to eq true
	end

	it 'variable capacity' do
		#act
		airport = Airport.new
		#assert
		expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY

		#act
		airport = Airport.new(200)
		#assert
		expect(airport.capacity).to eq 200
		#act
		airport = Airport.new(220)
		#assert
		expect(airport.capacity).to eq 220
	end

end