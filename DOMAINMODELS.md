## Domain Models for user stories

I did one for every test and added a test section as well, so I knew what
I was testing for. Kinda a Domain model table but not really. 


| Objects       | Messages      | Tests         |
| ------------- |:-------------:|:-------------:|
| plane         | land          | land at airport           |  
| plane         | take off      | from airport & confirm    |
| takeoff       | prevent       | take off when stormy      |
| landing       | prevent       | from airport & confirm    |
| airport       | landing       | when airport is full      |
| capacity      | overidden     | a default for many airports |
