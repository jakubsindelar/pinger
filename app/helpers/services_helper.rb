module ServicesHelper
  require 'timeout'
  require 'socket'

  def to_milliseconds time
    return ( time * 1000 ).round(0)
  end

  def ping(host, port)
    begin
      Timeout.timeout(5) do
        beginning_time = Time.now
        s = TCPSocket.new(host, port)
        s.close
        end_time = Time.now
        return to_milliseconds( end_time - beginning_time )
      end
    rescue Errno::ECONNREFUSED
      return to_milliseconds( end_time - beginning_time )
    rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
      return 0
    end
  end

end
