require 'airport.rb'
require 'rspec/expectations'


describe Airport do
let(:plane) {double :plane }

     it { expect(subject).to respond_to(:accept_for_take_off).with(1).argument}
     it { expect(subject).to respond_to(:accept_for_landing).with(1).argument}

  describe '#initialize' do
     it "airport has a variable capacity" do
       capacity = 123
       airport = Airport.new(capacity)
       expect(airport.capacity).to eq capacity
     end
end
    it "sets the the capacity to default value when capacity is not provided" do
    	expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
end

     describe '#acceprt_for_take_off' do
  end
  # it "" do

   describe '#accept_for_landing' do
    #  it "accepts the plane for laning" do
      it "raises exception if Airport is full" do
        subject.capacity.times {subject.accept_for_landing(plane)}
        expect {subject.accept_for_landing(plane)}.to raise_error("Airport is full")
      end
    #end
  end
#   #      subject.accept_for_landing(plane)
#   #      expect(subject.accept_for_landing).to eq true
#   #    end
#   #  end
#   #   subject.
#   # end
#
# 		#
end
# #step 6 DEAFAULT_CAPACITY
