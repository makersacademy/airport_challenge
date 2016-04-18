require './docs/plane'

describe Plane do

	it { is_expected.to respond_to :plane_status}
	it { is_expected.to respond_to :take_off }
	it { is_expected.to respond_to :land }
	it { is_expected.to respond_to :flying }
	it { is_expected.to respond_to :landed }

	describe 'sunny weather' do 

		let(:airport) {double :airport, :storage => [subject], :airport_open? => true, :in_airport? => true, :releases_plane => [], :accepts_plane => [subject] }
		let(:airport1) {double :airport, :storage => [], :airport_open? => true, :in_airport? => true, :releases_plane => [subject, subject]}

			it 'can can change status to flying' do 
				subject.flying
				expect(subject.plane_status).to eq true
			end	

			it 'can can change status to landed' do 
				subject.flying
				subject.landed
				expect(subject.plane_status).to eq false
			end	
	end
end