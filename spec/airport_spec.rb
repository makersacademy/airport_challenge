require_relative '../lib/airport.rb'

describe Airport do

  let(:plane)  { double  :plane }
  let(:plane2)  { double  :plane }
  

  it "is an instance of airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it "can receive the land command" do
    expect(subject).to respond_to(:land)
  end

  it "can receive the take off command" do
    expect(subject).to respond_to(:take_off)
  end

  it "can receive the full? command" do
    expect(subject).to respond_to(:full?)
  end

  it "can receive the stormy? command" do
    expect(subject).to respond_to(:stormy?)
  end

  it "should be possible to declare the capacity of the airport" do
    a = Airport.new(100)
    expect(a.capacity).to eq 100
  end

  it "will prevent planes from landing when it is at full capacity" do
    a = Airport.new(1)
    a.land(plane2)
    expect{ a.land(plane) }.to raise_error("The airport is already full")
  end


  it "will successfully land planes when not stormy" do
  end

  it "will successfully take off planes when not stormy" do
  end

  it "will not land planes when stormy" do
  end

  it "will not take off planes when stormy" do
  end

  describe "after an instance of Plane has been instructed to land when capacity has not yet been reached" do
    before do
      subject.land(plane)
    end
    
    it "will store the plane in the airport" do
      expect(subject.planes.size).to eq 1
    end

    it "will report the plane's landing" do
      expect("#{plane} has successfully landed.")
    end
  
    it "will not allow the plane to land again" do
      expect(subject.land(plane)).to eq "That plane is already in the airport"
    end

    describe "after that instance of Plane has been instructed to take off again" do
      before do
        subject.take_off(plane)
      end
      
      it "will remove the plane from storage" do
      expect(subject.planes.size).to eq 0
      end
      
      it "will report the plane's departure" do
        expect("#{plane} has successfully departed.")
      end

      it "will not allow the plane to take off again" do
        expect(subject.take_off(plane)).to eq "That plane is not in the airport"
      end
    end
  end
end