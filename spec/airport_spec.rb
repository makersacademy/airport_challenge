require 'airport'

describe Airport do
	subject(:airport) { described_class.new }
	let(:plane) { Plane.new }

		describe '.land_plane' do
  		it {is_expected.to respond_to(:land_plane).with(1).argument}

  		context 'when passed a plane' do

  			it 'adds a plane to the airport' do
  				subject.land_plane(plane)
  				expect(subject.planes).to include(plane)
  			end

				context 'when plane has landed' do
					it 'indicates has_landed?' do
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
  				subject.land_plane(plane)
  				subject.fly_plane(plane)
  				expect(subject.planes).not_to include(plane)
  			end

				context 'when plane has taken off' do
					it 'indicates plane is in flight' do
						subject.land_plane(plane)
						subject.fly_plane(plane)
						expect(plane.has_landed?).to eq false
						expect(plane.is_flying?).to eq true
					end
				end

  		end
  	end
end