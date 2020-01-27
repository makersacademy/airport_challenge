require './lib/airport.rb'
describe Airport do
  describe '#landing' do
    it 'accept a landing plane' do
      plane = Plane.new
      expect(subject.landing(plane)).to eq plane
    end

    it 'raises an error when the airport is full' do
      subject.landing(Plane.new)
      expect{subject.landing Plane.new}.to raise_error("The airport is full")
    end
  end

  it { should respond_to(:takeoff) }

  it 'it expect a plane to be gone after take off' do
    plane = subject.takeoff
    expect(plane).to be_gone
  end

end
