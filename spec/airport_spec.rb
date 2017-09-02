require 'Airport'

describe Airport do

  describe '#land' do
    it 'instructs a plane to land' do
      plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end
  end
end
#A) look up how respond_to matchers work
#B) think about your return value. What do you want subject.land(plane) to return?


#[4:18]
#It might be a good idea as much as possible for the moment use the to eq matchers
