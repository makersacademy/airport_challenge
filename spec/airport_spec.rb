require 'airport'
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double(:plane, land: "The plane has landed") }
  describe '#count' do
    it 'counts a plane that landed' do
      plane = double(:plane, land: "The plane has landed")
      expect(airport.count([plane])).to eq 1
    end

    it "counts 2 planes that landed" do
      plane2 = double(:Plane, land: "the plane has landed")
      planes = [plane, plane2]
      expect(airport.count(planes)).to eq 2
    end
  end

  # describe '#full' do
  #   it 'raises an exception when the maximum of 1 planes have landed' do
  #     airport = Airport.new
  #     plane = double(:plane, land: "The plane has landed")
  #     landed_planes = plane.land
  #     expect {airport.count(landed_planes)}.to raise_exception "The airport is full"
  #   end
  # end
end
