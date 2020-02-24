require 'airport'
require 'weather'

shared_context "common" do
  let(:plane) { Plane.new }
  before { allow(subject.weather).to receive(:stormy?) { false } }
end

describe Airport do

  include_context "common"

  it "should have a default capacity of 1" do
    expect(subject).to have_attributes(capacity: 20)
  end
  it "should be able to change the default capacity" do
    airport = Airport.new(10)
    expect(airport).to have_attributes(capacity: 10) 
  end
  
  describe '#land' do
    
    it "puts a plane in the hanger once it has landed" do
      expect { subject.land(plane) }.to change { subject.hanger.length }.by(1)
    end
    it "raises an error if the weather is too stormy to land" do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error("It's too stormy to land")
    end
    it "raises an error if the plane has already landed" do
      allow(plane).to receive(:flying?) { false }
      expect(subject.land(plane)).to eq "Plane is already in the hanger"
    end
  end

  describe '#takeoff' do

    it "removes a plane in the hanger when it takes off" do
      subject.land(plane)
      expect { subject.takeoff(plane) }.to change { subject.hanger.length }.by(-1)
    end
    it "gives a message confirming the plane has left" do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq "A plane has left the airport"
    end
    it "raises an error if the weather is too stormy to takeoff" do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.takeoff(plane) }.to raise_error("It's too stormy to take off")
    end
    it "raises an error if there are no planes in the hanger" do 
      expect { subject.takeoff(plane) }.to raise_error("The hanger is empty")
    end
    it "raises error if plane tries to takeoff but is already flying" do
      allow(plane).to receive(:landed).and_return(false)
      expect { subject.takeoff(plane) }.to raise_error("Plane is already flying")
    end
  end

  describe '#full' do
    # airport responds to private full method
    it { is_expected.not_to respond_to :full? }

    it 'fails when the airport is full' do
      allow(plane).to receive(:landed).and_return(false)
      20.times { subject.land(plane) }
      error = 'Airport full'
      expect { subject.land(double :plane) }.to raise_error error
    end
  end  

end
