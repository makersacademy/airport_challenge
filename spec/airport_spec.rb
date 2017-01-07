require "airport"
describe Airport do

it {is_expected.to respond_to :land}
it {is_expected.to respond_to(:land).with(1).argument }
it "should send a message when landed" do
expect(subject.land("plane")).to include("plane has landed")
end
it {is_expected.to respond_to :take_off}
it "should confirm when taken off" do
expect(subject.take_off("plane")).to include("plane has taken off")
end
it "should have the plane when a plan has landed" do
expect(subject.land("plane")).to include("plane")
end
it "should raise an error when landing and weather is stormy" do
expect {10.times {subject.land("plane")}}.to raise_error "no landing possible because of weather conditions"
end
it "should raise an error when taking off and weather is stormy" do
expect {10.times {subject.take_off("plane")}}.to raise_error "no take off possible because of weather conditions"
end
it "should raise an error if max cap has been reached" do
expect {(Airport::DEFAULT_CAPACITY).times {subject.land("plane")}}.to raise_error "airport is full"
end


end
