# encoding: utf-8
require "logstash/outputs/base"
require "logstash/namespace"
require "logstash/json"

# An example output that pushes data into ITDA
class LogStash::Outputs::Itda < LogStash::Outputs::Base
  config_name "itda"

  config :host, :validate => :string, :required => true
  config :port, :validate => :string, :required => true
  config :api_key, :validate => :string, :required => false
  config :protocol, :validate => :string, :required => false
  config :messageonly, :validate => :string, :required => false

  public
  def register
    require "net/http"
    require "uri"
    @url = "#{@protocol}://#{@host}:#{@port}/"
    @uri = URI.parse(@url)
    @client = Net::HTTP.new(@uri.host, @uri.port)

#    @codec.on_event do |event, data|
#      $stdout.write(data)
#    end

  end # def register

  public
  def receive(event)

    event.remove('@timestamp')
    event.remove('@version')

#    itda_event = Hash.new
#    itda_fields = event['@fields']
#    itda_event = itda_fields.merge itda_event
#    @logger.debug("ITDA fields", :itda_fields => itda_fields)
#    @logger.debug("ITDA message", :itda_message => event.message)

#     h.each { |k, v| puts "Key=#{k}, Value=#{v}" }
#     begin
#         @logger.debug("Key = 

    request = Net::HTTP::Post.new(@uri.path)
    request.basic_auth(@api_key, '')

    @logger.debug("ITDA event", :itda_event => event)

    begin
      if @messageonly
        message = event.remove('message')
        @logger.debug("ITDA message", :itda_message => message)

        request.body = message
        request.add_field("Content-Type", 'text/plain')
      else
        request.body = LogStash::Json.dump(event)
        request.add_field("Content-Type", 'application/json')
      end
      response = @client.request(request)
      @logger.warn("ITDA convo", :request => request.inspect, :response => response.inspect)
      raise unless response.code == '200'
    rescue Exception => e
      @logger.warn(
        "Unhandled exception",
        :request => request.inspect,
        :response => response.inspect,
        :exception => e.inspect
      )
    end

    return "Event received"
  end # def event
end # class LogStash::Outputs::Itda
