# logstash-output-itda
A logstash output plugin to send data into ITDA.

# Documentation

# Pre-requisites
A To be able to use this plugin, you need the following
* Installation of BMC TrueSight IT Data Analytics
* Create a Data collector of type (Receive over TCP/UDP)

# Usage
Once you have installed the plugin, you can use it in the logstash configuration, by specifying the "itda" output.
E.g.
itda {
    host => "localhost"
    port => "4646"
    protocol => "http"
  }
# This is using ITDA data pattern
  itda {
    host => "localhost"
    port => "4545"
    protocol => "http"
    messageonly => "true"
  }

|| Property || Value (Default) || Description ||
| host | | |
| port | | |
| protocol | | |
| messageonly | false | |


