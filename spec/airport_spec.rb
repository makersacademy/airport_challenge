
require 'airport'

describe Airport do

	subject(:airport){ described_class.new }     
																						
	it { is_expected.to respond_to :land }

	it 'confirmation plane landed' do
		expect(subject.land Plane.new).to eq "Plane has landed"
	end

	it { is_expected.to respond_to :take_off }

	it 'take off when airport is empty' do
		subject = Airport.new
		expect(subject.take_off).to eq nil
	end

	it 'take off after land' do
		subject = Airport.new
		subject.land(Plane.new)
		expect(subject.take_off).to eq nil
	end

	it { is_expected.to respond_to :full? }

	it 'checks airport is full' do
		expect(subject.full?).to eq false
		subject.land Plane.new
		expect(subject.full?).to eq true
	end


end