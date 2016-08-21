require 'airport.rb'

describe Airport do

  it "instructs plane to land" do
    plane = Plane.new
    subject.land(plane)
    expect(plane).to be_landed
  end

  it "instructs a plane to take off" do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane.instance_variable_get(:@landed)).to eq false

  end

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

  it 'raises an error when the airport is full' do
  10.times { subject.land Plane.new }
  expect { subject.land Plane.new }.to raise_error 'Airport full'
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
