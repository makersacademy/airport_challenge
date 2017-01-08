require 'plane'

describe Plane do

  context "when class is initialized it should have certain status" do
    it 'status is true by default' do
      plane = Plane.new
      expect(plane.status).to eq(true)
    end
    it 'status is false' do
      plane = Plane.new(false)
      expect(plane.status).to eq(false)
    end
    it 'status is true ' do
      plane = Plane.new(true)
      expect(plane.status).to eq(true)
    end

  end

  it 'checks if plane can fly' do
    expect(subject.in_air?).to eq(true)
  end

  it 'checks for plane status through received parameters' do
    expect(subject.in_air?(true)).to eq(true)
    expect(subject.in_air?(false)).to eq(false)
  end

end
