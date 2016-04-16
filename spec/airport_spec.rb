require 'airport.rb'
require 'rspec/expectations'

describe Airport do
     it { expect(subject).to respond_to :accept_for_take_off}
     it { expect(subject).to respond_to :accept_for_laning}

  # it "" do
  #   subject.
  # end
#  it "sets the the capacity to default value when capacity is not provided" do
	#		expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
		#
end
#step 6 DEAFAULT_CAPACITY
