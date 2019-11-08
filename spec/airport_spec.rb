require 'airport'
describe Airport do
  subject { described_class.new }
# instruct a plane to land at an airport
it 'instructs a plane to land' do
 expect(subject).to respond_to(:land).with(1). argument
end
end
#
# #instruct a plane to take off from an airport
# describe Airport do
#   it {is_expected.to respond_to(:takeoff).with(1). argument}
# end
#
# #landing cant be done when the airport is full. We need to have a count for this.
# #does not accept planes and raise and error .
# describe Airport do
#   it "doesnot accept planes and raise an error when full" do
#     expect {airport.land(plane)}.to raise_error('Airport is full,the plane cannot land.')
#   end
# end
