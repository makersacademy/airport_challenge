require "airport.rb"
require "plane.rb"
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'should allow developer to change capacity when needed' do
    expect(Airport.new(5).capacity).to eq 5
  end

  describe '#land_plane(plane)' do
    it "should be able to land plane" do
      expect(subject.land_plane(plane)).to eq subject.planes_at_airport
    end

    it "should be able to prevent landing if weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land_plane(plane) }.to raise_error('Cannot land weather is Stormy')
    end

    it "should'nt be able to land planes if airport full" do
      subject.capacity.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error('no more landing space')
    end
  end

  describe '#take_off(plane)' do
    it "should be able to tell plane to take off" do
      expect(subject.take_off(plane)).to eq nil
    end

    it "should be able to prevent take off if weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error('Cannot take off weather is Stormy')
    end
  end
end
