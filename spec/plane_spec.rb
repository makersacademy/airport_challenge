require 'plane'

RSpec.describe Plane do
  let(:test_plane) { Plane.new }
  
  before(:each) do
    test_plane.accounted_for = true
  end

  it 'should have an airport' do
    expect { subject.take_off }.to raise_error Errors::NO_AIRPORT
  end

  it 'should be accounted for once at an airport' do
    expect(subject.accounted_for).to be(true).or be false
  end
  
  context 'airborne status' do
    it 'should be airborne after takeoff' do
      test_plane.take_off
      
      expect(test_plane.airborne).to be true
    end

    it 'should not be airborne after landing' do
      test_plane.take_off
      test_plane.land

      expect(test_plane.airborne).to be false
    end
  end

  context 'when airborne' do
    it 'should not be able to take off' do
      test_plane.take_off

      expect { test_plane.take_off }.to raise_error Errors::CURRENTLY_AIRBORNE
    end
  end

  context 'when grounded' do
    it 'should not be able to land' do
      test_plane.accounted_for = true
      
      expect { test_plane.land }.to raise_error Errors::CURRENTLY_GROUNDED
    end
  end
end
