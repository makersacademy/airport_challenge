require 'airport'

describe Airport do
  describe '#landing' do
    it 'lands the plane' do
      subject.landing(Plane.new)
      expect(subject.landing(Plane.new)).to eq @plane
    end

    # it "raises an error when the weather is stormy" do
    #   weather = "stormy"
    #   expect{subject.landing(Plane.new)}.to raise_error 'Not a good weather to land'
    # end
    #
    # it "raises an error when the airport is full" do
    #   capacity.full?
    #   expect{subject.landing(Plane.new)}.to raise_error 'No space for landing'
    # end

  end

  describe '#take_off' do
    plane = Plane.new
    subject.take_off(plane)
    it 'takes off the plane' do
      expect(subject.take_off(plane)).to eq Plane.new
    end

    # it "raises an error when the weather is stormy" do
    #   weather = "stormy"
    #   expect{subject.take_off(plane)}.to raise_error 'Not a good weather to fly'
    # end
  end

end
