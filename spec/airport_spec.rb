require "airport.rb"
describe Airport do
  let(:plane) { double(:plane) }

  describe '#land' do

    it { should respond_to(:land).with(1).argument }

    it 'allows planes to land' do

    end
  end

  describe "#take_off" do

    it { should respond_to(:take_off).with(1).argument }

    it "allows planes to take off" do
    end
  end
end