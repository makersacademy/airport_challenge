require 'airport'

describe Airport do
	subject(:airport) { described_class.new }
	let(:plane) { Plane.new }
	let(:airport) { double :airport }

		describe '.land_plane' do
  		it {is_expected.to respond_to(:land_plane).with(1).argument}

  		context 'when passed a plane' do

  			it 'adds a plane to the airport' do
  				allow(airport).to receive(:stormy).and_return(false)
  				subject.land_plane(plane)
  				expect(subject.planes).to include(plane)
  			end

				context 'when plane has landed' do
					it 'indicates has_landed?' do
						allow(airport).to receive(:stormy).and_return(false)
						subject.land_plane(plane)
						expect(plane.has_landed?).to eq true
					end
				end

  		end
  	end

  	describe '.fly_plane' do
  		it {is_expected.to respond_to(:fly_plane).with(1).argument}

  		context 'when passed a plane' do
  			it 'removes a plane from the airport' do
  				allow(airport).to receive(:stormy).and_return(false)
  				airport.land_plane(plane)
  				airport.fly_plane(plane)
  				expect(airport.planes).not_to include(plane)
  			end

				context 'when plane has taken off' do
					it 'indicates plane is in flight' do
						allow(airport).to receive(:stormy).and_return(false)
						subject.land_plane(plane)
						subject.fly_plane(plane)
						expect(plane.has_landed?).to eq false
						expect(plane.is_flying?).to eq true
					end
				end

  		end
  	end

  	describe '.ground_planes' do
  		it {is_expected.to respond_to(:ground_planes)}
  			context 'when grounded' do
  				it 'planes cannot take off' do
  					allow(airport).to receive(:stormy).and_return(true)
  					plane.has_landed = true
  					expect{subject.fly_plane(plane)}.to raise_error "Stormy Weather - All operations ceased"
  				end
  				it 'planes cannot land' do
  					allow(airport).to receive(:stormy).and_return(true)
  					expect{subject.land_plane(plane)}.to raise_error "Stormy Weather - All operations ceased"
  				end
  			end
  	end
end