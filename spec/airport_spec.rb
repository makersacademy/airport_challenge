require 'Airport'

describe Airport do

  describe '#land' do
    it 'lands planes at airport' do
      plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
    end
  end
end
#A) look up how respond_to matchers work
#B) think about your return value. What do you want subject.land(plane) to return?


#[4:18]
#It might be a good idea as much as possible for the moment use the to eq matchers
