require 'airport'
require 'pry'

describe Airport do
  let(:airport) {subject}


  it { should respond_to :full?}

  it "has a capacity" do
    airport.capacity >= 0
  end

  it "has weather" do
    expect(airport.weather).not_to be_nil
  end
end
