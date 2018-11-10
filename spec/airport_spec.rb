require 'airport'

describe 'Airport' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:sunny) { allow(WEATHER).to receive(:sample) { "Sunny" } }
  let(:stormy) { allow(WEATHER).to receive(:sample) { "Stormy" } }

  it 'can create an airport' do
    expect(Airport.new).to be_instance_of(Airport)
  end

  describe '#land' do
    context 'when the weather is sunny' do
      before '' do
        sunny
      end
      it 'can land and conmfirms the plane has landed' do
        expect(airport.land(plane)).to eq "Safely landed"
      end

      it 'will prvent #land from executing if landing strip is full (max can be 20)' do
        expect { 21.times { airport.land(plane) } }.to raise_error("Sorry, no room")
      end
    end

    context 'when the weather is stormy' do
      it 'will throw an error if #land is called when whether is stormy' do
        stormy
        expect { airport.land(plane) }.to raise_error("Sorry, too stormy")
      end
    end
  end

  describe '#take_off' do
    context 'when the weather is sunny' do
      before '#take_off, set weather to be sunny' do
        sunny
      end
      it 'confirms plane not at aiport after #take_off' do
        2.times { airport.land(plane) }
        expect(airport.take_off).to eq "flight number #{plane} is no longer at the airport"
      end

      it 'confirms plane is not on the landing_strip after #take_off' do
        airport.land(plane)
        airport.take_off
        expect(airport.landing_strip).not_to include(plane)
      end

      it "will thrown an error if a plane takes tires to #take_off while flying" do
        flying_plane = Plane.new(true)
        expect { airport.take_off(flying_plane) }.to raise_error("Can not take off: Plane is in the air")
      end

      it "will throw an error if plane tries to take off but is not at the airport" do
        bowing_747 = Plane.new(true)
        gatwick = Airport.new
        heathrow = Airport.new
        gatwick.land(bowing_747)
        expect { heathrow.take_off(bowing_747) }.to raise_error("Can not take off: Plane is not at the airport")
      end

    end

    context 'when the weather is stormy' do
      it 'will throw an error if #take_off is called when whether is stormy' do
        stormy
        expect { airport.take_off }.to raise_error("Sorry, too stormy")
      end
    end
  end

  it "Will allow you to increase the max capacity of the aiport (default is 20)" do
    sunny
    airport.max_capacity = 22
    expect { 21.times { airport.land(plane) } }.not_to raise_error
  end
end

describe 'Plane' do
  let(:plane) { Plane.new }
  it 'can create a plane' do
    expect(plane).to be_instance_of(Plane)
  end
end
