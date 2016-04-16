require 'airport'

describe Airport do
	let(:plane_ingoodweather){ double(:plane_ingoodweather, :stormy? => false, :land => nil) }
		
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
		end

end