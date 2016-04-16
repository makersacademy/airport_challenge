require 'airport'

describe Airport do
	let(:goodweather){ double(:goodweather, :stormy? => false) }
	let(:badweather){ double(:badweather, :stormy? => true) }
	let(:plane){ spy(:plane) }

		context 'when receiving a plane' do

			context 'when weather is good' do
				context 'when docking station is not full' do
					it '#receive should store the plane' do
						subject.receive(plane,goodweather)
						expect(subject.landed).to include plane
					end
					it '#receive should tell the plane it has landed' do
						subject.receive(plane,goodweather)
						expect(plane).to have_received(:land).with(subject)
					end
				end
				context 'when docking station is full' do
					let(:airport) do
						airport = Airport.new(5)
						5.times { airport.receive(plane,goodweather) }
						airport
					end
					it '#receive should not store the plane' do
						airport.receive(plane,goodweather)
						expect(airport.landed.length).to eq 5
					end
					it '#receive should tell the plane landing failed' do
						airport.receive(plane,goodweather)
						expect(plane).to have_received(:land_fails).with("full")
					end
				end
			end

			context 'when weather is bad' do
				context 'when docking station is not full' do
					it '#receive should not store the plane' do
						subject.receive(plane,badweather)
						expect(subject.landed).not_to include plane
					end
					it '#receive should tell the plane landing failed' do
						subject.receive(plane,badweather)
						expect(plane).to have_received(:land_fails).with("weather")
					end
				end
			end

		end

end