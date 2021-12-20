require 'airport'

describe Airport do

  it { should respond_to(:full?) }

  it "should return true when asked if full when default capacity is reached" do
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }
    
    Airport::DEFAULT_CAPACITY.times { 
      plane = Plane.new
      plane.takeoff(weather)
      plane.land(subject, weather) }

    expect(subject.full?).to eq true
  end

end