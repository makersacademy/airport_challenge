require 'airport.rb'

describe 'Airport' do
  let(:airport) { Airport.new }

  DEFAULT_CAPACITY = 10

  it 'creates an instance of the Airport class' do
    expect(airport).to be_an_instance_of(Airport)
  end

  describe '#land' do
    it "lands a plane" do
      expect(airport).to respond_to(:land).with(1).argument
    end
    it "raises an error when the airport is full" do
      DEFAULT_CAPACITY.times { airport.land Airport.new }
      expect { airport.land Airport.new }.to raise_error 'Airport is at full capacity'
    end
  end

  describe '#take_off' do
    it "enables plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end

end
