require "weather" 
require "plane"
require "airport" 

describe Airport do 

  describe 'Initialization' do 
    it 'has a variable capacity' do
      airport = Airport.new(15)
      15.times { airport.land Plane.new }
      expect { airport.land(Plane.new) }.to raise_error "This airport is full"
    end 
  end 

  it "has a default capacity" do 
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end 

  describe 'initialization' do 
    subject { Airport.new }
    let (:plane) { Plane.new }
    it 'defaults capacity' do 
      describe_class::DEFAULT_CAPACITY.times do 
        subject.landing(plane)
      end 
      expect { subject.landing(plane) }.to raise_error "This airport is full"
    end 
  end 

  describe "#landing" do  
    
    it { is_expected.to respond_to :plane }

    it { is_expect.to respond_to(:landing).with(1).argument } 

    it "Should raise an error if an 16th plane lands" do 
      Airport::DEFAULT_CAPACITY.times { subject.landing Plane.new }
      plane = Plane.new 
      expect { subject.landing(plane) }.to raise_error("This airport is full") 
    end 
    
    it "Should land a plane in the airport" do 
      subject.stormy = false 
      expect(subject.landing(plane)).to include(plane) 
    end 
  end 

  describe "#take_off" do 

    it { is_expected.to respond_to(:takeoff_plane).with(1).argument }

    it "Should allow a plane to take off from the airport" do 
      subject.stormy = false 
      expect(subject.take_off(plane)).to eq plane 
    end 

    it "Should stop airplane from taking off if the weather is stormy" do 
      subjct.stormy = true 
      expect { subject.take_off(plane) }.to raise_error "The weather is stormy, the plane cannot take off" 
    end 
  end 
end
