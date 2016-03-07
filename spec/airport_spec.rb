require './docs/airport'

describe Airport do 

let(:plane) {double :plane, :plane_status => true, :landed => false}
let(:plane2) {double :plane, :plane_status => false, :flying => false}

	it { is_expected.to respond_to :in_airport?}

	it 'has a default capacity of 50' do
		expect(subject.capacity).to eq 50
	end

	it 'can have a different maximum capacity' do
		airport = Airport.new(30)
	end

	describe "not stormy weather" do

		before do
			subject.stub(:airport_open?).and_return(true)
		end

		it 'can see that a plane is currently flying' do
			expect(subject.plane_location(plane)).to eq 'This plane is flying.'
		end

		it 'can see where a plane is currently located' do
			subject.storage << plane2
			expect(subject.plane_location(plane2)).to eq subject
		end

		it 'can accept planes' do
			subject.accepts_plane(plane)
			expect(subject.storage).to eq [plane]
		end

		it 'can release planes' do
			subject.storage << plane2
			subject.releases_plane(plane2)
			expect(subject.storage).to eq []
		end 

		it 'can release planes' do
			subject.storage << plane2
			expect{subject.releases_plane(plane2)}.to change {subject.storage.size}.by(-1)
		end 

		it 'can store any number of planes below it\'s capacity' do 
			20.times {subject.storage << plane}
			expect(subject.storage.length).to eq 20
		end

		it 'can check if the plane is in a particular airport' do
			subject.storage << plane
			expect(subject.in_airport?(plane)).to eq true
		end

		it 'won\'t release a plane if the plane is not currently stationed at that airport' do 
			expect {subject.releases_plane(plane2)}.to raise_error 'This plane is not at this airport, so it cannot take off from here.'
		end

		it 'won\'t release a plane if the plane is currently in the air' do
			expect {subject.releases_plane(plane)}.to raise_error 'This plane is already in the air, so it cannot take off.'
		end
	end

	describe "stormy weather" do

		before do
			subject.stub(:airport_open?).and_return(false)
		end

		it "will not accept planes when the weather is stormy" do
			expect(subject.accepts_plane(plane)).to eq "Due to stormy weather, this airport is closed." 
		end

		it 'will not allow planes to take off in stormy weather' do
			expect(subject.releases_plane(plane)).to eq "Due to stormy weather, this airport is closed." 
		end

	end

end

