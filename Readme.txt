Sample Sinatra application for Fyber Mobile Offer API.

Sinatra was chosen as a lightweight and simple alternative to Rails or Padrino.
We need here only 2 endpoints, one for GET, and one for POST. Fast, small, easy, easy to test, too.
After all, it doesn't make much sense to shoot the sparrows from a cannon.

Process of retrieving data could be implemented inline in the "POST /" endpoint - after all, it's 3 simple lines plus json parsing. But that would be a pain to test, thus the FyberClient class was added.

RestClient was chosen as http client because it's a well tested and proved solution, both powerful and simple.

--
