# Airport challenge

This is a weekend challenge from Makers Academy week 1. It simulates an airport with random weather which can store, take off, and land planes. Stormy weather prevents planes from taking off and landing

# Tests

![Tests](https://i.gyazo.com/44a4de0bc5112c24054f80a60a104769.png)

## My Approach

My approach to this challenge was to prevent as many edge cases as possible. Planes can be stored in each airport in the respective **planes** array, but I felt that checking if the plane object is in the current airports planes would not be enough. For example you could **.land** a plane which is at airport 3000 at airport 2000, because it's not in airport 2000s hangar.

To prevent this I used a **current_airport** attribute for the **Plane** class. Prior to this, the plane objects didn't store any information because they didn't need to. This attribute allows you specifically see where a plane currently is, and allows for more detailed error messages. All planes start with no airport (nil).

For the random weather, I made a **Weather** class and had a new object created by default for each landing and take off. This way the weather is randomly decided each time these two methods are run, because each call of **.stormy** has a 10% chance of returning true. The user can't manually control the weather.

## Doubles

Due to the progress we made in the pairing challenge this week, I wanted to test my knowledge of mocks in Rspec by utilising doubles. I only tested each class in isolation, which meant that I had to mock every **Plane** object when I was testing the **Airport** class, which was where the majority of the methods were.

This caused many challenges because of the **current_airport** attribute and how it had to be updated every time a plane lands or takes off. I had to frequently use stubs to tell the plane doubles to expect this message and update it accordingly, as well as ensuring the test was testing what I wanted it to. It was quite the challenge but I learned a lot about mocks and feel more confident going into week 2.
