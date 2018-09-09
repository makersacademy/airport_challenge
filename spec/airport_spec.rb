require 'airport'

describe Airport do
  context '[ Purpose: result ]' do

    [:take_off, :instruct_landing, :capacity_full?, :stormy?, :store_plane].each do |method_name|
      it "should be able to call #{method_name}" do
        gatwick = Airport.new("Gatwick")
        expect(gatwick).to respond_to(method_name)
      end

    end
    #
    # it 'should be able to call take_off' do
    #   # purpose: result.
    #   gatwick = Airport.new("Gatwick")
    #   expect(gatwick).to respond_to(:take_off)
    # end

    it 'should be created with an existing instance variable @hangar' do
      # purpose: result.
      gatwick = Airport.new("Gatwick")
      expect(gatwick::hangar).to be_empty
    end

    it 'should allow for Airport to be initalized with custom capacity' do
      # purpose:result
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
        gatwick.instruct_landing(plane)
        expect(gatwick::hangar).to include(plane)
      end

      it 'should raise error if capacity is full and plane tries to land' do
        plane = double('plane')
        plane2 = double('plane')
        gatwick = Airport.new("Gatwick", 1)
        gatwick.instruct_landing(plane)
        expect{gatwick.instruct_landing(plane2)}.to raise_error("Full capacity. Keep flying buddy.")
      end
    end

    context 'capacity_full?' do

      it 'should return true when hangar is full' do
        plane = double('plane')
        gatwick = Airport.new("Gatwick", 1)
        gatwick.instruct_landing(plane)
        expect(gatwick.capacity_full?).to be true
      end

      it "should return false when hangar isn't full" do
        plane = double('plane')
        gatwick = Airport.new("Gatwick", 2)
        gatwick.instruct_landing(plane)
        expect(gatwick.capacity_full?).to be false
      end

    end
    # context 'take_off' do
    #
    #   it 'should remove plane from hangar which has taken off' do
    #
    #   end
    #
    # end
  end
end
