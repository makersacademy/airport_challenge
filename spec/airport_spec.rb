require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context 'when full' do
      it 'raises an error' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport is full'
      end
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end




#
# describe Airport do
#   let(:plane) { double(:plane)}
#
#   it "allow planes to land at an airport" do
#     expect(subject.land(plane)).to eq subject.planes
#   end
#
#   it "instructs planes to take off from an airport" do
#     subject.land(plane)
#     subject.take_off(plane)
#     expect(subject.planes).to eq []
#   end
#
#   it "does not allow planes to take off if weather is stormy" do
#     subject.take_off(plane)
#     subject.stormy= true
#     expect { subject.take_off(plane) }.to raise_error "Sorry mate- storm's a brewin"
#   end
#
#   it "does not allow planes to land if weather is stormy" do
#     subject.stormy= true
#     expect { subject.land(plane) }.to raise_error "Sorry mate- storm's a brewin"
#   end
#
#   it "does not allow planes to land if airport is full" do
#     subject.capacity.times { subject.land(plane) }
#     expect {subject.land(plane)}.to raise_error "Sorry mate- this airport is full..."
#   end
#
#   it "has a default capacity that is set upon initialization" do
#     expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
#   end
#
#
# end
