require 'airport'
require 'weather'

describe Airport do
  subject {Airport.new(20)}

  it { is_expected.to respond_to :stormy_weather?}
  it { is_expected.to respond_to(:confirm_landing).with(1).argument}
  it { is_expected.to respond_to :confirm_takeoff}

  describe '#confirm_landing' do

     context 'if weather is fine' do
        it "should confirm landing by adding a new plane in the aiport" do
        plane = Plane.new
        allow(subject).to receive(:stormy_weather?).and_return(false)
        expect(subject.confirm_landing(plane)).to eq [plane]
        end
     end

     context 'if weather is stormy' do
       it "should raise error and not confirm landing" do
       plane = Plane.new
       allow(subject).to receive(:stormy_weather?).and_return(true)
       expect {subject.confirm_landing(plane)}.to raise_error 'Stormy weather, cannot land'
       end
     end

     context 'if airport is full' do
       it 'should raise errors and not confirm landing' do
       plane = Plane.new
       allow(subject).to receive(:stormy_weather?).and_return(false)
       Airport::DEFAULT_CAPACITY.times { subject.confirm_landing Plane.new }
       expect { subject.confirm_landing(plane)}.to raise_error 'Cannot land, airport full'
       end
     end
  end

  describe '#confirm_takeoff' do

    context 'if airport is empty' do
      it 'should raise error at takeoff' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.planes = []
      expect {subject.confirm_takeoff}.to raise_error 'No planes to takeoff'
      end
    end

    context "if weather is fine" do
      it "should confirm takeoff by removing a plane from the airport" do
      plane = Plane.new
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.confirm_landing(plane)
      expect(subject.confirm_takeoff).to eq plane
      end
    end

    context "if weather is stormy" do
      it 'should raise error when confirming takeoff - fail error' do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      #subject.confirm_landing(plane)
      expect {subject.confirm_takeoff}.to raise_error 'Stormy weather, cannot takeoff'
      end
    end
  end

   context 'changing capacity for new airport' do
     it 'changes the capacity when entering a new aiport' do
       airport = Airport.new(30)
       expect(airport.capacity).to eq 30
     end

     it 'has a default value if nothing entered' do
       expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
     end
   end


end
