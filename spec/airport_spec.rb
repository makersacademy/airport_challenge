require 'airport'

describe Airport do
  let(:plane) { Airport.new }

  it " allows planes to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end 
  it "takes off from an airport" do
    subject.take_off
    expect(subject.take_off).to eq "Plane has taken off"
  end
  
#   describe 'initialization' do
#     subject { Airport.new }
#     let(:plane) { Plane.new }
#     it 'defaults capacity' do
#       described_class::DEFAULT_CAPACITY.times do
#         subject.land(plane)
#       end
#     end
#   end 
  it " does not allow landing when full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(Airport.new) }
    expect { subject.land(plane) }.to raise_error "Airport is full" 
  end
end 
