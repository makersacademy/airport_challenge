require 'air_traffic_controller'

describe 'Air_traffic_controller' do

  describe 'attributes' do

    subject { Air_traffic_controller.new }
    it "allows reading and writing for :first_name" do
      subject.first_name = 'Andy'
      expect(subject.first_name).to eq('Andy')
    end

    it "allows reading and writing for :last_name" do
      subject.last_name = 'Smith'
      expect(subject.last_name).to eq('Smith')
    end

    it "allows reading and writing for :id_number" do
      subject.id_number = 'AndySmith213x'
      expect(subject.id_number).to eq('AndySmith213x')
    end

  end

  # describe '#full_name' do
  #
  #   it "returns a string in the expected format" do
  #     @honda = Car.new(:make => 'Honda', :year => 2004, :color => 'blue')
  #     expect(@honda.full_name).to eq('2004 Honda (blue)')
  #   end
  #
  #   context 'when initialized with no arguments' do
  #     it 'returns a string using default values' do
  #       car = Car.new
  #       expect(car.full_name).to eq('2007 Volvo (unknown)')
  #     end
  #   end
  #
  # end
end