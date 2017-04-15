require './lib/airport'

describe Airport do

  it 'has weather' do
    expect(subject).to respond_to(:weather)
  end

  it '#weather can be #sunny or #stormy' do
    expect(subject.weather).to eq("Sunny").or(eq("Stormy"))
  end

  it "has a default #name the Airport" do
    expect(subject.name).to eq("the Airport")
  end

  it "can be named" do
    airport = Airport.new("test")
    expect(airport.name).to eq("test")
  end

  it "has a #runway" do
    expect(subject.runway.class).to eq(Array)
  end

  it "can be #full" do
    expect(subject).to respond_to(:full?)
  end

  it "recognised #runway with 10 as #full" do
    subject.runway = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "a"]
    expect(subject).to be_full
  end

  it "landing #plane goes into #runway" do
    plane = double(:plane)
    subject.land_plane(plane)
    expect(subject.runway).to eq([plane])
  end

  it "#plane leaves #runway after #takeoff" do
    plane = double(:plane)
    subject.runway = [plane]
    subject.takeoff_plane(plane)
    expect(subject.runway).to eq([])
  end
end
