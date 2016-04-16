require 'airport'

describe Airport do
	let(:goodweather){ double(:goodweather, :stormy? => false) }
	let(:badweather){ double(:badweather, :stormy? => true) }
	let(:plane){ spy(:plane) }
	let(:airport_with_goodweather){ Airport.new(5,goodweather) }
	let(:airport_with_badweather){ Airport.new(5,badweather) }

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
						expect(plane).to have_received(:land_fails).with("full")
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
						expect(plane).to have_received(:land_fails).with("weather")
					end
				end
			end
		end

end