require 'airport'
require 'plane'
require 'weather'

describe Airport do 
it { is_expected.to respond_to :land }
it { is_expected.to respond_to :take_off }
it { is_expected.to (respond_to :bad_conditions?) }
it { is_expected.to (respond_to :full?) }
it { is_expected.to (respond_to :empty?) }

describe "landing" do 
context "landing in a non stormy weather" do 
	before do 
		allow(subject).to receive(:bad_conditions?).and_return false
	end 
	it "responds to landing" do 
		expect(subject).to respond_to(:land).with(1).argument 
	end 
end 
context "landing in a full airport in a non stormy weather" do 
	before do 
		allow(subject).to receive(:bad_conditions?).and_return false
	end 
	it "doesn't allow to land when full" do 
		airport = Airport.new
		(Airport::CAPACITY).times { airport.land(Plane.new) }
		expect { airport.land(Plane.new) }.to raise_error("The airport is full")
 end 
end 
context "landing in a stromy weather and not allowing it" do
	before do 
		allow(subject).to receive(:bad_conditions?).and_return true
	end 
	it "doesn't allow to land" do 
		expect { subject.land(Plane.new) }.to raise_error "It is stormy!"	 
	end 
end 

describe "taking off" do
  context "taking off when its not stormy" do
  before do 
    allow(subject).to receive(:bad_conditions?).and_return false
  end 
  it "responds to taking off" do 
    expect(subject).to respond_to(:take_off).with(1).argument
  end 
end 

context "taking off when it is empty but not  stormy" do 
 before do 
    allow(subject).to receive(:bad_conditions?).and_return false 
  end 
  it "raises an error when a plane is trying to take off and its not at the airport" do 
    expect { subject.take_off(Plane.new) }.to raise_error("There are no planes!") 
  end 
end 
end 

context "taking off when it is stormy but not empy" do 
	before do 
		allow(subject).to receive(:bad_conditions?).and_return true
		allow(subject).to receive(:empty?).and_return false
	end 
	it "raises an error because it is stromy" do 
		plane = Plane.new
		plane.land
		expect { subject.take_off(plane) }.to raise_error("It is stormy!")
	end 
end 

end 
end 