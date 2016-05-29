require 'airport'

describe Airport do

	subject {Airport.new(3)}

	it {is_expected.to respond_to(:arrival)}

	it {is_expected.to respond_to(:departure)}

	it {is_expected.to respond_to(:change_weather)}

	it 'changes the weather and checks it' do
		expect(subject.change_weather).to eq false
	end

	it 'tries to accept and arriving plane in bad weather' do
		subject.change_weather
		expect{subject.arrival}.to raise_error("Can't land during stormy weather")
	end

	it 'tries to depart a plane in bad weather' do
		subject.change_weather
		expect{subject.departure}.to raise_error("Can't take off during stormy weather")
	end
end
