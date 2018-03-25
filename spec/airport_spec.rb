require './lib/airport.rb'

describe Airport do
	 it { is_expected.to respond_to :let_takeoff }

	 it { is_expected.to respond_to(:let_landing).with(1).argument }

	 it { is_expected.to respond_to :plane }

	 it 'let planes to takeoff' do
		  plane = subject.let_takeoff
		  expect(plane). to be_status_grounded
	 end

	 it 'lets plane to land' do
    plane = Planes.new
		subject.let_landing(plane)
    expect(subject.let_landing(plane)).to eq plane
  end

end
