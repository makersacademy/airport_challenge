require 'airport'

describe Airport do

  context '#permission_to_land' do
    it { is_expected.to respond_to(:permission_to_land).with(1).argument }

    it 'a plane has landed at the airport' do
      plane = double :plane
      allow(subject).to receive(:weather_stormy?) {false}
      allow(plane).to receive(:landing)
      expect(subject.permission_to_land(plane)).to eql(subject.planes)
    end
  end

  context "when the airport is full" do
    it "raises an error" do
      plane = double :plane
        allow(subject).to receive(:weather_stormy?) {false}
        allow(plane).to receive(:landing)
        subject.capacity.times { subject.permission_to_land(plane) }
        expect { subject.permission_to_land(plane) }.to raise_error 'The Airport is full'
    end
  end

  context "when bad weather conditions" do

    it "raises an error" do
      plane = double :plane
      allow(subject).to receive(:weather_stormy?) {true}
      expect { subject.permission_to_land(plane) }.to raise_error 'Bad weather conditions'
    end
  end

  describe '#permission_to_take_off' do
    it { is_expected.to respond_to(:permission_to_take_off).with(1).argument }

    it 'a plane has left the airport' do
      plane = double :plane
      allow(subject).to receive(:weather_stormy?) {false}
      allow(plane).to receive(:landing)
      subject.permission_to_land(plane)
      allow(plane).to receive(:take_off)
      subject.permission_to_take_off(plane)
      expect(subject.planes).to be_empty
    end

    context "when there are no planes at the airport" do
      it 'raises an error' do
        expect { subject.permission_to_take_off(:plane) }.to raise_error "No planes at the airport"
      end
    end

    context 'when weather is stormy' do
      it 'raises an error' do
        plane = double :plane
        allow(subject).to receive(:weather_stormy?) {false}
        allow(plane).to receive(:landing)
        subject.permission_to_land(plane)
        allow(subject).to receive(:weather_stormy?) {true}
        allow(plane).to receive(:take_off)
        expect { subject.permission_to_take_off(plane) }.to raise_error 'Bad weather conditions'
      end
    end
  end
end

# describe '#permission_to_take_off' do
#
#   context "accepts a number of arguments" do
#     before { expect(subject).to receive(:permission_to_take_off).with(any_args) }
#
#     it 'with 1 argument' do
#       subject.permission_to_take_off(:plane1)
#     end
#
#     it 'with 3 arguments' do
#       subject.permission_to_take_off(:plane1, :plane2, :plane3)
#     end
#   end
# end
#
# context "1 or more planes can land" do
#   before do
#      expect(subject).to receive(:permission_to_land).with(any_args)
#      allow(subject).to receive(:weather_stormy?) {false}
#      plane1 = double :plane1
#      plane2 = double :plane2
#      allow(plane1).to receive(:landing)
#      allow(plane2).to receive(:landing)
#    end
#
#   it 'a single plane can land' do
#     subject.permission_to_land(:plane1)
#   end
#
#   it 'two planes can land at the same time' do
#     subject.permission_to_land(:plane1, :plane2)
#   end
#
# end
#
# describe Airport do
#
#   let(:plane) { double("plane", :landing) }
#
#   describe 'when the weather is sunny' do
#
#     context '#permission_to_land' do
#       before(:each) do
#         allow(subject).to receive(:weather_stormy) {false}
#         plane = double :plane
#         allow(plane).to receive(:landing)
#       end
#       it { is_expected.to respond_to(:permission_to_land).with(1).argument }
#
#       #context 'when the airport is full' do
#         it 'it will raise an error' do
#           subject.capacity.times { subject.permission_to_land(plane) }
#           expect { subject.permission_to_land(plane) }.to raise_error 'The Airport is full'
#         end
#       #end
#     end
#   end
# end
