# frozen_string_literal: true

require "socket"
require "webrick"

module WebrickHere
  # web server 全体を管理する class。
  class WebServer
    # 自分の IP addresses を表示
    def self.display_myip
      udp = UDPSocket.new
      udp.connect("128.0.0.0", 7)
      adrs = Socket.unpack_sockaddr_in(udp.getsockname)[1]
      udp.close
      adrs
    end

    # web server 開始
    def self.start
      srv = WEBrick::HTTPServer.new({ DocumentRoot: "./",
                                      BindAddress: "127.0.0.1",
                                      Port: 8080 })
      trap("INT") { srv.shutdown }
      srv.start
    end
  end
end
