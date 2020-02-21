require 'airport'
describe Airport do
it {is_expected.to respond_to :take_off}
it {is_expected.to respond_to(:land).with(1).argument}

  describe '#land' do
    it "lands a plane" do 
      plane = Plane.new
      expect(subject.land(plane)[0]).to eq plane
    end 
  end


  describe '#take_off' do
    it "tells us when a plane takes off" do
      airport = subject
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "The plane has taken off"
    end

    it "raises an error when there's no plane to take off" do
      expect {subject.take_off(Plane.new)}.to raise_error
    end

  end

  it "raises an error when the airport is full" do 
    Airport::CAPACITY.times do
      subject.land(Plane.new)
    end
    expect { subject.land(Plane.new) }.to raise_error
  end

  it "fails when you land an already landed plane" do 
    plane = Plane.new
    airport = subject.land(plane)
    expect {airport.land(plane)}.to raise_error
  end

  it "raises an error when the try to take off with no planes" do
    expect {subject.take_off}.to raise_error
  end
end
