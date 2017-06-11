require 'airport'

describe Airport do 

	let(:plane) { double :plane }
	let(:weather) { double :weather }
	let(:airport) {Airport.new}
	it {is_expected.to respond_to(:receive).with(1).argument}
	it {is_expected.to respond_to(:release).with(1).argument}
	it {is_expected.to respond_to(:full?)}
  it {is_expected.to respond_to(:stormy?)}
  before(:each) do
  	allow(plane).to receive(:status)
  end 
  before(:each) do
  	allow(plane).to receive(:land)
  end 
  describe "Airport capacity" do
    it "has a capacity of 50 by default" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "Has a capacity of a certain number when specified" do
      random_capacity = rand(1..200)
      airport = Airport.new(random_capacity)
      expect(airport.capacity).to eq random_capacity
    end
  end 
	
	describe "#receive" do
		
		it "is expected to land a plane and receive it" do
			subject.receive(plane)
			expect(plane).to eq subject.planes.last
		end 
		context "when it is stormy" do
			it "does not allow landing" do
				airport.weather = "Stormy"
				expect { airport.receive plane }.to raise_error("Stormy conditions!")
			end 
		end 
		context "when it is sunny" do
			it "allows landing" do
				airport.weather = "Sunny"
				expect { airport.receive plane }.not_to raise_error("Stormy conditions!")
			end 
		end 
		context "when airport is full" do
			it "does not allow landing" do
				50.times { airport.receive plane }
				expect { airport.receive plane }.to raise_error("The airport is full!")
			end 
		end 
		it "does not receive a plane that's already landed" do
			allow(plane).to receive(:status).and_return "Landed"
			expect { airport.receive plane }.to raise_error("Plane already landed!")
		end 
	end 

	describe "#release" do
		it "releases a plane" do
			airport.receive(plane)
			allow(plane).to receive(:take_off)
			airport.release(plane)
			expect(airport.planes.count).to eq 0
		end 
		context "when it is stormy" do
			it "does not allow take off" do 
				airport.weather = "Stormy"
				expect {airport.release plane }.to raise_error("Stormy conditions!")
			end 
		end 
		context "when it is sunny" do
			it "allows take off" do 
				airport.weather = "Sunny"
				expect {airport.release plane }.not_to raise_error("Stormy conditions!")
			end 
		end 
		it "does not release a plane that's already flying" do
			allow(plane).to receive(:status).and_return "Flying"
			expect { airport.release plane }.to raise_error("Plane already flying!")
		end 
		it "does not release a plane that's not in the airport" do
			airport1, airport2 = Airport.new, Airport.new
			plane1 = instance_double(Plane)
			plane2 = instance_double(Plane)
			allow(plane1).to receive(:status)
			allow(plane2).to receive(:status)
			allow(plane1).to receive(:land)
			allow(plane2).to receive(:land)
			airport1.receive(plane1)
			airport2.receive(plane2)
			expect { airport1.release plane }.to raise_error("Plane not in the airport!")
		end 
	end  
	describe "#stormy?" do 
		it "signals that the weather is stormy" do
			subject.weather = "Stormy"
			expect(subject.stormy?).to eq true                                              
		end 
	end 

	describe "#full?" do
		it "tells if the airport is full" do
			allow(plane).to receive(:land)
			50.times { airport.receive plane }
			expect(airport).to be_full
		end 
	end 

end 