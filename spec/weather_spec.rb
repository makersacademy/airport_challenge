require 'weather'

describe Weather do 

	it {is_expected.to respond_to :generate_num}

	it 'generates a random number' do
		expect(subject.generate_num).to be_an_instance_of(Fixnum)
	end
end