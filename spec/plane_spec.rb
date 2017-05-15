describe Plane do

  describe 'initialize' do
    it 'instantiates a plane with a name' do
      expect(Plane.new("concord").name).to eq "concord"
    end

    it 'instantiates planes that are flying' do
      expect(Plane.new("plane").currently_flying).to eq true
    end

  end

end
