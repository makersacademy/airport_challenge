require './lib/plane.rb'

describe Plane do

  it 'responds to land method' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'confirms that not at the airport'do
    expect(subject.take_off).to eq("not at the airport")
  end

  it "prevents landing when airport is full" do
    expect{subject.land}.to raise_error("Airport is full")
  end
  
end
