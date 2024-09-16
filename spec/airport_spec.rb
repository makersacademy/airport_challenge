require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }


 describe '#land' do
   it "raises an error when full" do
     subject.land (Plane.new)
     expect { subject.land Plane.new }.to raise_error "Airport full"
   end
 end
end
