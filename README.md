# logstash-output-itda
A logstash output plugin to send data into ITDA.

## Documentation

Logstash provides infrastructure to automatically generate documentation for this plugin. We use the asciidoc format to write documentation so any comments in the source code will be first converted into asciidoc and then into html. All plugin documentation are placed under one [central location](http://www.elastic.co/guide/en/logstash/current/).

- For formatting code or config example, you can use the asciidoc `[source,ruby]` directive
- For more asciidoc formatting tips, see the excellent reference here https://github.com/elastic/docs#asciidoc-guide

## Need Help?

Need help? Try #logstash on freenode IRC or the https://discuss.elastic.co/c/logstash discussion forum.

## Developing

### 1. Plugin Developement and Testing

#### Code
- To get started, you'll need JRuby with the Bundler gem installed.

- Create a new plugin or clone and existing from the GitHub [logstash-plugins](https://github.com/logstash-plugins) organization. We also provide [example plugins](https://github.com/logstash-plugins?query=example).

- Install dependencies
```sh
bundle install
```

#### Test

- Update your dependencies

```sh
bundle install
```

- Run tests

```sh
bundle exec rspec
```

## Pre-requisites

To be able to use this plugin, you need the following
* Installation of BMC TrueSight IT Data Analytics
* Create a Data collector of type (Receive over HTTP/HTTPS)

## Usage
Once you have installed the plugin, you can use it in the logstash configuration, by specifying the "itda" output.
E.g.
```sh
    itda {
        host => "localhost"
        port => "4646"
        protocol => "http"
      }
```

```sh
      itda {
        host => "localhost"
        port => "4545"
        protocol => "http"
        messageonly => "true"
      }
```

### Fields

| Property    | Value (Default) | Description |
--------------|-----------------|-------------|
| host        |                 | Host of the ITDA HTTP/HTTPS collector            |
| port        |                 | Port of the ITDA HTTP/HTTPS collector            |
| protocol    |                 | Protocol of the ITDA HTTP/HTTPS collector            |
| messageonly | false           | Only send the message, and not the other fields            |


## Contributing

All contributions are welcome: ideas, patches, documentation, bug reports, complaints, and even something you drew up on a napkin.

Programming is not a required skill. Whatever you've seen about open source and maintainers or community members  saying "send patches or die" - you will not see that here.

It is more important to the community that you are able to contribute.

For more information about contributing, see the [CONTRIBUTING](https://github.com/elastic/logstash/blob/master/CONTRIBUTING.md) file.


