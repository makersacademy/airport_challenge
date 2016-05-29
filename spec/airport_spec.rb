require 'airport'

describe Airport do

	subject {Airport.new(3)}

	let(:test_plane) { double :plane}
	let(:bad_weather) { double :weather, :good}

	
	it {is_expected.to respond_to(:arrival)}

	it {is_expected.to respond_to(:departure)}

	it 'tries to accpet a plane to a full airport' do
		
		allow(test_plane).to receive(:land).with(subject) {"result"}

		allow(Weather).to receive(:good_forecast?).and_return(true)

		expect{4.times{subject.arrival(test_plane)}}.to raise_error("Airport full!")
	end
end


# p subject.departure
# p subject.instance_variables
# p subject.instance_variable_get(:@planes)


# shared_examples_for Weather do
#   let(:instance) { described_class.new }

#   it 'does something exciting' do
#     instance.should_receive(:method_two).and_return('MANUAL')
#     expect(instance.method_one).to eq(some_value)
#   end
# end

# describe SomeController do
#   include_examples SomeModule
# end