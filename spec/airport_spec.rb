require 'airport'

describe Airport do
	let(:goodweather){ double(:goodweather, :stormy? => false) }
	let(:badweather){ double(:badweather, :stormy? => true) }
	let(:plane){ spy(:plane) }
	let(:airport_with_goodweather){ Airport.new(5, goodweather) }
	let(:airport_with_badweather){ Airport.new(5, badweather) }

		context 'when receiving a plane' do
			context 'when weather is good' do
				context 'when docking station is not full' do
					it '#receive should store the plane' do
						airport_with_goodweather.receive(plane)
						expect(airport_with_goodweather.landed).to include plane
					end
					it '#receive should tell the plane it has landed' do
						airport_with_goodweather.receive(plane)
						expect(plane).to have_received(:land).with(airport_with_goodweather)
					end
				end
				context 'when docking station is full' do
					it '#receive should not store the plane' do
						6.times { airport_with_goodweather.receive(plane) }
						expect(airport_with_goodweather.landed.length).to eq 5
					end
					it '#receive should tell the plane landing failed' do
						6.times { airport_with_goodweather.receive(plane) }
						expect(plane).to have_received(:land_fails).with(:full)
					end
					it '#receive should not store the plane when it already has 10 planes if no custom capacity is set' do
						airport = Airport.new
						11.times { airport.receive(plane) }
						expect(airport.landed.length).to eq 10
					end
				end
			end
			context 'when weather is bad' do
				context 'when docking station is not full' do
					it '#receive should not store the plane' do
						airport_with_badweather.receive(plane)
						expect(airport_with_badweather.landed).not_to include plane
					end
					it '#receive should tell the plane landing failed' do
						airport_with_badweather.receive(plane)
						expect(plane).to have_received(:land_fails).with(:weather)
					end
				end
			end
		end

		context 'when dispatching a plane' do
			context 'when weather is good' do
				it '#dispatch should release the plane from its landed array' do
					airport_with_goodweather.receive(plane)
					airport_with_goodweather.dispatch(plane)
					expect(airport_with_goodweather.landed).not_to include plane
				end
				it '#dispatch should tell the plane it is taking off' do
					airport_with_goodweather.receive(plane)
					airport_with_goodweather.dispatch(plane)
					expect(plane).to have_received(:take_off)
				end
			end
			context 'when weather is bad' do
				it '#dispatch should not try to delete from the airport\'s landed array' do
					expect(airport_with_badweather.landed).not_to receive(:delete).with(plane)
					airport_with_badweather.dispatch(plane)
				end
				it '#dispatch should tell the plane that take off failed' do
					airport_with_badweather.dispatch(plane)
					expect(plane).to have_received(:take_off_fails)
				end
			end

		end

end