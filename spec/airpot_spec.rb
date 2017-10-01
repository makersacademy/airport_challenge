require 'airport'


class Plane
end

describe Airport do


  it 'allows a plane to land at airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land plane
    airport.stub(:storm?) {false}
    expect(airport.plane[0]).to eq(plane)
  end


  it 'Stops plane landing if storm' do
    plane = Plane.new
    airport = Airport.new
    airport.land plane
    airport.stub(:storm?) {true}
    expect(airport.land(plane)).to eq('The weather is too bad to fly')
  end


  it 'when take_off method is called it returns an instance of Plane class' do
    subject.stub(:storm?) {false}
    subject.land(Plane.new)
    # subject.stub(:storm?) {false}
    expect(subject.take_off). to be_an_instance_of(Plane)
  end


  it 'when take_off method is called but there is a storm' do
    # subject.stub(:storm?) {true}
    airport = Airport.new
    # airport.stub(:storm?) {true}
    airport.land(Plane.new)
    airport.stub(:storm?) {true}
    expect(airport.take_off).to eq('The weather is too bad to fly')
  end


  it 'raises an error when you to run take_off method when no planes present' do
    expect {subject.take_off}.to raise_error 'All planes have gone'
  end


  it 'generates a random number between 0-9'do
    expect(subject.num).to be >= 0
    expect(subject.num).to be < 9
  end


  it 'generates a random boolean to indicate if there is a storm' do
    subject.stub(:num) {1}
    expect(subject.storm?).to eq(true)
    subject.stub(:num) {4}
    expect(subject.storm?).to eq(false)
  end


  context 'die_hard method is called in the case of a terrorist attack at Christmas time' do
    it 'produces John McClane' do
      expect(subject.die_hard).to eq('John McClane')
    end
  end
end
