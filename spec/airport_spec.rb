require 'airport'

describe Airport do
	let(:plane_ingoodweather){ double(:plane_ingoodweather, :stormy? => false, :land => nil, :land_fails => nil) }
	let(:plane_inbadweather){ double(:plane_inbadweather, :stormy? => true, :land_fails => nil) }
	

		context 'when receiving a plane' do

			context 'when weather is good' do
				context 'when docking station is not full' do
					it '#receive should store the plane' do
						subject.receive(plane_ingoodweather)
						expect(subject.landed).to include plane_ingoodweather
					end
					it '#receive should tell the plane it has landed' do
						expect(plane_ingoodweather).to receive(:land).with(subject)
						subject.receive(plane_ingoodweather)
					end
				end
				context 'when docking station is full' do
					let(:airport) do
						airport = Airport.new(5)
						5.times { airport.receive(plane_ingoodweather) }
						airport
					end
					it '#receive should not store the plane' do
						airport.receive(plane_ingoodweather)
						expect(airport.landed.length).to eq 5
					end
					it '#receive should tell the plane landing failed' do
						expect(plane_ingoodweather).to receive(:land_fails).with("full")
						airport.receive(plane_ingoodweather)
					end
				end

			end

			context 'when weather is bad' do
				context 'when docking station is not full' do
					it '#receive should not store the plane' do
						subject.receive(plane_inbadweather)
						expect(subject.landed).not_to include plane_inbadweather
					end
					it '#receive should tell the plane landing failed' do
						expect(plane_inbadweather).to receive(:land_fails).with("weather")
						subject.receive(plane_inbadweather)
					end
				end

			end
		end

end