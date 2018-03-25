require './lib/airport.rb'

describe Airport do
	 it { is_expected.to respond_to :let_takeoff }

	 it 'lets planes to takeoff' do
		  plane = subject.let_takeoff
		  expect(plane). to be_status_grounded
	 end

end
