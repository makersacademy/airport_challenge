## Domain Models for user stories


| Objects       | Messages      | Tests         |
| ------------- |:-------------:|:-------------:|
| plane         | land          | land at airport           |  
| plane         | take off      | from airport & confirm    |
| takeoff       | prevent       | take off when stormy      |
| landing       | prevent       | from airport & confirm    |
| airport       | landing       | when airport is full      |
| capacity      | overidden     | a default for many airports |
