require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  before(:each) do
    allow(plane).to receive(:landed).and_return(false)
    allow(plane).to receive(:land).and_return(@landed = true)
    allow(plane).to receive(:take_off).and_return(@landed = false)
  end
  
  describe "#airport capacity" do
    it "ensures a default capacity of 20 is set" do
      expect(subject.instance_variable_get(:@capacity)).to eq 5
    end
    
    it "enables user to override airport capacity" do
      another_airport = Airport.new(10)
      expect(another_airport.instance_variable_get(:@capacity)).to eq 10
    end
  end

  describe "#lands planes" do

    context "good weather" do

      before(:each) do
        allow(subject).to receive(:stormy?).and_return(false)
      end

      it "plane that has landed can be found in the airport" do
        subject.land(plane)
        expect(subject.send(:planes).last).to eq plane
      end
      
      it "planes landed at different airport cannot land" do
        allow(plane).to receive(:landed).and_return(true)
        message = "Plane has already landed somewhere else"
        expect { subject.land(plane) }.to raise_error message
      end

      it "prevents landing when airport is full" do
        5.times { subject.land(plane) }
        message = "Airport is at full capacity"
        expect { subject.land(plane) }.to raise_error message
      end

    end

    context "bad weather" do

      before(:each) do
        allow(subject).to receive(:stormy?).and_return(true)
      end

      it "prevent landing when weather is stormy" do
        message = "Weather is too bad"
        expect { subject.land(plane) }.to raise_error message
      end

    end

  end

  describe "#takes off planes" do

    context "good weather" do

      before(:each) do
        allow(subject).to receive(:stormy?).and_return(false)
      end

      it "after plane takes off, it is no longer at the airport" do
        subject.send(:planes) << plane
        subject.take_off(plane)
        expect(subject.send(:planes).length).to eq 0
      end

      it "planes that are flying cannot take off" do
        subject.send(:planes) << plane
        subject.take_off(plane)
        message = "this plane isn't at the airport"
        expect { subject.take_off(plane) }.to raise_error message
      end

      it "planes can only take off from airport they are in" do
        another_airport = Airport.new
        allow(another_airport).to receive(:stormy?).and_return(false)
        subject.send(:planes) << plane
        message = "this plane isn't at the airport"
        expect { another_airport.take_off(plane) }.to raise_error message
      end

    end
    
    context "good weather" do
    
      it "don't let plane take off if weather is stormy" do
        allow(subject).to receive(:stormy?).and_return(true)
        subject.send(:planes) << plane
        message = "Weather is too bad"
        expect { subject.take_off(plane) }.to raise_error message
      end
    end

  end

  describe "#feature test with two airports, three planes and only sunny weather", type: :feature do

    let(:plane) { double(:plane) }
    let(:plane_2) { double(:plane_2) }
    let(:plane_3) { double(:plane_3) }

    before do
      allow(plane_2).to receive(:landed).and_return(false)
      allow(plane_2).to receive(:land).and_return(@landed = true)
      allow(plane_2).to receive(:take_off).and_return(@landed = false)
      allow(plane_3).to receive(:landed).and_return(false)
      allow(plane_3).to receive(:land).and_return(@landed = true)
      allow(plane_3).to receive(:take_off).and_return(@landed = false)
      @another_airport = Airport.new
      allow(subject).to receive(:stormy?).and_return(false)
      allow(@another_airport).to receive(:stormy?).and_return(false)
    end

    it "planes travel between airports with one left at each" do
      the_planes_land
      one_travels_between_airports
      this_plane_takes_off_again
      should_be_only_first_plane_at_my_airport
      should_be_only_second_plane_at_another_airport
      third_plane_should_not_be_landed
    end

    def the_planes_land
      subject.land(plane)
      subject.land(plane_2)
      @another_airport.land(plane_3)
    end

    def one_travels_between_airports
      subject.take_off(plane_2)
      @another_airport.land(plane_2)
    end

    def this_plane_takes_off_again
      @another_airport.take_off(plane_3)
    end

    def should_be_only_first_plane_at_my_airport
      expect(subject.send(:planes).last).to eq(plane)
    end

    def should_be_only_second_plane_at_another_airport
      expect(@another_airport.send(:planes).last).to eq(plane_2)
    end

    def third_plane_should_not_be_landed
      expect(plane_3.landed).to eq(false)
    end

  end
  
end
