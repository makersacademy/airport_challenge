require 'airport'

describe Airport do
	let(:plane_ingoodweather){ double(:plane_ingoodweather, :stormy? => false, :land => nil) }
	let(:plane_inbadweather){ double(:plane_inbadweather, :stormy? => true, :land => nil) }
	

		context 'when receiving a plane' do

			context 'when weather is good' do

				context 'when docking station is not full' do
					it '#receive should store the plan' do
						subject.receive(plane_ingoodweather)
						expect(subject.landed).to include plane_ingoodweather
					end
					it '#receive should tell the plane it has landed' do
						expect(plane_ingoodweather).to receive(:land).with(subject)
						subject.receive(plane_ingoodweather)
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
						expect(plane_inbadweather).to receive(:land_fails).with(subject)
						subject.receive(plane_inbadweather)
					end
				end

			end
		end

end