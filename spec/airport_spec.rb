require 'airport'

describe Airport do
  describe '#weather' do
      it 'when the number is higher than 85, returns "stormy"' do
        port = Airport.new
        allow(port).to receive(:rand).and_return(90)
        expect(port.weather).to eq("stormy")
      end
      it 'when the number is lower than 85, returns "sunny"' do
        port = Airport.new
        allow(port).to receive(:rand).and_return(35)
        expect(port.weather).to eq("sunny")
      end
    end

  describe '#take_off' do
    it 'when the plane takes off, it confirms' do
      plane = Plane.new
      subject.landing(plane)
      expect(subject.take_off).to eq plane
    end

# I need to fix it to raise an error
    # it "raises an error when the weather is stormy" do
    #   weather = "stormy"
    #   expect{subject.take_off}.to raise_error 'Not a good weather to fly'
    # end
  end

# I need to fix it to returns same plane (not in array)
  describe '#landing' do
    it 'lands the plane' do
      plane = Plane.new
      subject.landing(plane)
      expect(subject.plane).to eq [plane]
    end

# I need to fix it with correct capacity (that raise an error)
    # it "raises an error if the airport is full" do
    #   subject.landing(Plane.new)
    #   30.times {subject.landing(Plane.new)}
    #   expect{subject.landing(Plane.new)}.to raise_error 'No space for landing'
    # end

# I need to fix it to raise an error
    # it "raises an error when the weather is stormy" do
    #   weather = "stormy"
    #   expect{subject.landing(Plane.new)}.to raise_error 'Not a good weather to land'
    # end
  end

end
