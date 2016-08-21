require 'airport.rb'

describe Airport do

  describe "Instructs a plane to" do
  it "take off" do
    plane = double(:plane, :landed => true)
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane

    end

    it "land" do
      plane = Plane.new
      subject.land(plane)
      expect(plane).to be_landed
    end
  end


  describe "Storms" do
    it "no take off in storms" do
      subject.instance_variable_set(:@weather, "stormy")
      plane = Plane.new
      expect { subject.take_off(plane)}.to raise_error "Too stormy"
    end


    it "no landing in storms" do
      subject.instance_variable_set(:@weather, "stormy")
      plane = Plane.new
      expect { subject.land(plane)}.to raise_error "Too stormy"
    end

  describe "airport capacity" do
    it "sets airport capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'raises an error when the airport is full' do
    10.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport full'
    end

  end

  describe 'initialization' do
    let(:plane) { double(:plane) }
    it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
        end
        expect{ subject.land(plane) }.to raise_error 'Airport full'
      end
    end
  end
end
