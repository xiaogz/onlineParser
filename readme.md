## onlineParser

Simply make a web request to the service to fetch the title and description of the site.

Deployed at http://onlineparser-xiaogz.rhcloud.com/(outdated by Sept. 30, 2017; see below) and https://online-parser.herokuapp.com/
  * it might take ~5 seconds for the servers to wake up before first use
  * due to OpenShift/RedHat shutting down OpenShift Online v2 by Sept. 30, 2017 and going to v3, I had to migrate the parser from rhcloud to this nasty url: http://onlineparser-onlineparser.1d35.starter-us-east-1.openshiftapps.com/

Benefits:

* No need to parse the webpage's title and site description yourself
