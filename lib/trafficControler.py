import passenger
import airplane

class trafficController(passenger, airplane):
    """bla bla bla"""

    def __init__(self):
        super(trafficController, self).__init__()

    def destination(self):
        print('destination')

    def instruction(self):
        print('landing of taking off')
