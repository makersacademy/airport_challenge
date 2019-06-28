import pytest

def traffic_controller():
    raise ValueError("Exception raised: no flies expected")

def checkFly():
    pass

def test_traffic_controller():
    with pytest.raises(ValueError, TrafficController):
        traffic_controller()
