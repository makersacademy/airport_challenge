import Passenger
import Airplane

import pytest
import unittest

class TrafficController(Passenger, Airplane):
    """bla bla bla"""

    def __init__(self):
        super(trafficController, self).__init__(Passenger, Airplane)


    # @pytest.mark.skipif(condition, *, reason=None)
    # @pytest.mark.xfail(condition=None, *, reason=None, raises=None, run=True, strict=False)
        #expected to fail
    def destination(self):
        pass

    def instruction(self):
        pass

    def fly (self):
            pass



if __name__ == "__main__":
    #fly01 = trafficController("tururu", "airbus07147")
    unittest.main()
