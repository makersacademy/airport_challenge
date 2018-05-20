require 'AirTrafficController'


describe AirTrafficController do 
	let(:plane) { double(:Plane) }
	let(:airport) { double(:Airport) }

	it 'responds to methods' do
		expect(subject).to respond_to(:land_at)
		expect(subject).to respond_to(:take_off_from)
	end

	describe '#land_at' do

		it 'lands a plane at an airport' do
			#arrange
			allow(plane).to receive(:state).and_return('in_air')
			allow(airport).to receive(:planes).and_return([])
			allow(airport).to receive(:full?).and_return(false)
			#act
			subject.weather = 'sunny'
			subject.land_at(airport, plane)
			#arrange
			allow(plane).to receive(:state).and_return('landed')
			#allow(airport).to receive(:planes.last).and_return(plane)
			#assert
			expect(airport.planes.last).to eq plane
			expect(plane.state).to eq 'landed'
		end

		it 'doesnt land a plane at full airport' do
			#arrange
			allow(plane).to receive(:state).and_return('in_air')
			allow(airport).to receive(:full?).and_return(true)

			#act
			subject.weather = 'sunny'
			
			#assert
			expect{ subject.land_at(airport, plane) }.to raise_error ("Can't authorize landing! Airport is full")
			expect(plane.state).to eq 'in_air'
		end

		it 'doesnt land a plane when stormy' do
			#arrange
			allow(plane).to receive(:state).and_return('in_air')
			subject.weather = 'stormy'
			
			#assert
			expect{ subject.land_at(airport, plane) }.to raise_error ("It is too stormy to land or take off")
			expect(plane.state).to eq 'in_air'
		end


	end

	describe '#take_off_from' do
		it 'doesnt take off a plane when stormy' do
			#arrange
			allow(plane).to receive(:state).and_return('landed')
			subject.weather = 'stormy'
			
			#assert
			expect{ subject.land_at(airport, plane) }.to raise_error ("It is too stormy to land or take off")
			expect(plane.state).to eq 'landed'
		end

		it 'confirm that plane is no longer in the airport after take off' do
			#arrange
			allow(plane).to receive(:state).and_return('in_air')
			allow(airport).to receive(:planes).and_return([])
			allow(airport).to receive(:full?).and_return(false)
			#act
			subject.weather = 'sunny'
			subject.land_at(airport, plane)
			#assert
			expect(airport.planes.include?(plane)).to eq true
			#arrange
			allow(plane).to receive(:state).and_return('landed')
			#act
			subject.take_off_from(airport, plane)
			#assert
			expect(airport.planes.include?(plane)).to eq false
		end

	end

	it 'avoiding double landing and take offs' do
		#arrange
		allow(plane).to receive(:state).and_return('landed')
		allow(airport).to receive(:full?).and_return(false)
		#act
		subject.weather = 'sunny'
		#assert
		expect{ subject.land_at(airport,plane) }.to raise_error ('Plane is already landed!')
		#arange
		allow(plane).to receive(:state).and_return('in_air')
		#assert
		expect{ subject.take_off_from(airport,plane) }.to raise_error ("Plane is already in the air")

	end


end