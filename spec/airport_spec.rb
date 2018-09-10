require 'airport'

describe Airport do
  context '[ Purpose: result ]' do

    [:take_off, :instruct_landing, :capacity_full?, :stormy?, :store_plane].each do |method_name|
      it "should be able to call #{method_name}" do
        gatwick = Airport.new("Gatwick")
        expect(gatwick).to respond_to(method_name)
      end

    end

    it 'should be created with an existing instance variable @hangar' do
      gatwick = Airport.new("Gatwick")
      expect(gatwick::hangar).to be_empty
    end

    it 'should allow for Airport to be initalized with custom capacity' do
      gatwick = Airport.new("Gatwick", 500)
      expect(gatwick::capacity).to eq(500)
    end

    it "should set default of 1 when capacity isn't given with Airport creation" do
      gatwick = Airport.new("Gatwick")
      class_default_value = 1
      expect(gatwick::capacity).to eq(class_default_value)
    end
  end

  context '[ Purpose: method call ]' do

    context 'instruct_landing method' do

      it 'should be able to accept a plane into the hangar' do
        plane = double('plane')
        gatwick = Airport.new("Gatwick")
        allow(gatwick).to receive(:stormy?).and_return(false)
        gatwick.instruct_landing(plane)
        expect(gatwick::hangar).to include(plane)
      end

      it 'should raise error if capacity is full and plane tries to land' do
        plane = double('plane')
        plane2 = double('plane')
        gatwick = Airport.new("Gatwick", 1)
        allow(gatwick).to receive(:stormy?).and_return(false)
        gatwick.instruct_landing(plane)
        expect { gatwick.instruct_landing(plane2) }.to raise_error("Full capacity. Keep flying buddy.")
      end

      it 'should allow plane to land if weather is good' do
        plane1 = { flight_num: 'FIN0099', destination: 'Helsinki' }
        gatwick = Airport.new("Gatwick", 2)
        allow(gatwick).to receive(:stormy?).and_return(false)
        gatwick.instruct_landing(plane1)
        expect(gatwick::hangar).to include(plane1)
      end

      it "shouldn't allow plane to land if weather is stormy" do
        plane1 = { flight_num: 'FIN0099', destination: 'Helsinki' }
        gatwick = Airport.new("Gatwick", 2)
        allow(gatwick).to receive(:stormy?).and_return(true)
        expect { gatwick.instruct_landing(plane1) }.to raise_error("Don't land, it's too stormy to aid you safely!")
      end

    end

    context 'capacity_full?' do

      it 'should return true when hangar is full' do
        plane = double('plane')
        gatwick = Airport.new("Gatwick", 1)
        allow(gatwick).to receive(:stormy?).and_return(false)
        gatwick.instruct_landing(plane)
        expect(gatwick.capacity_full?).to be true
      end

      it "should return false when hangar isn't full" do
        plane = double('plane')
        gatwick = Airport.new("Gatwick", 2)
        allow(gatwick).to receive(:stormy?).and_return(false)
        gatwick.instruct_landing(plane)
        expect(gatwick.capacity_full?).to be false
      end

    end
    context 'take_off' do

      it 'should remove plane from hangar which has taken off' do
        plane1 = { flight_num: 'FIN0099', destination: 'Helsinki' }
        plane2 = { destination: 'Melbourne', flight_num: 'AUS9978' }
        gatwick = Airport.new("Gatwick", 2)
        allow(gatwick).to receive(:stormy?).and_return(false)
        gatwick.instruct_landing(plane1)
        gatwick.instruct_landing(plane2)
        gatwick.take_off(plane1)
        expect(gatwick::hangar).to_not include(plane1)
      end

      it 'should not allow plane to take off if stormy' do
        plane1 = { flight_num: 'FIN0099', destination: 'Helsinki' }
        gatwick = Airport.new("Gatwick", 2)
        allow(gatwick).to receive(:stormy?).and_return(false)
        gatwick.instruct_landing(plane1)
        allow(gatwick).to receive(:stormy?).and_return(true)
        expect { gatwick.take_off(plane1) }.to raise_error("Due to adverse weather conditions, planes must stay grounded.")
      end

      it 'should allow plane to take off if weather is good' do
        plane1 = { flight_num: 'FIN0099', destination: 'Helsinki' }
        gatwick = Airport.new("Gatwick", 2)
        allow(gatwick).to receive(:stormy?).and_return(false)
        gatwick.instruct_landing(plane1)
        gatwick.take_off(plane1)
        expect(gatwick::hangar).to be_empty
      end
    end

    context 'stormy?' do
      it 'should return boolean' do
        gatwick = Airport.new("Gatwick")
        expect(gatwick.stormy?).to be(true).or be(false)
      end
    end

  end
end
