require "spec_helper"

describe Pstatus do
  let(:success){[200, 201, 202, 203, 204, 205, 206, 207, 208, 226]}
  let(:success_message) { ["OK", "Created", "Accepted", "Non-Authoritative Information",
                          "No Content", "Reset Content", "Partial Content",
                          "Multi-Status (WebDAV)", "Already Reported (WebDAV)", "IM Used"] }

  let(:information) { [100, 101, 102] }
  let(:information_message) { ["Continue", "Switching Protocols", "Processing (WebDAV)"] }

  let(:redirection) { [300, 301, 302, 303, 304, 305, 307, 308] }
  let(:redirection_message) { ["Multiple Choices", "Moved Permanently", "Found",
                              "See Other", "Not Modified", "Use Proxy",
                              "Temporary Redirect", "Permanent Redirect (experiemental)"] }

  let(:client) { [400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410,
                  411, 412, 413, 414, 415, 416, 417, 418, 420, 422, 423,
                  424, 425, 426, 428, 429, 431, 444, 449, 450, 499] }
  let(:client_message) { ["Bad Request", "Unauthorized", "Payment Required", "Forbidden",
                          "Not Found", "Method Not Allowed", "Not Acceptable", "Proxy Authentication Required",
                          "Request Timeout", "Conflict", "Gone", "Length Required", "Precondition Failed",
                          "Request Entity Too Large", "Request-URI Too Long", "Unsupported Media Type",
                          "Requested Range Not Satisfiable", "Expectation Failed", "I'm a teapot (RFC 2324)",
                          "Enhance Your Calm (Twitter)", "Unprocessable Entity (WebDAV)", "Locked (WebDAV)",
                          "Failed Dependency (WebDAV)", "Reserved for WebDAV", "Upgrade Required", "Precondition Required",
                          "Too Many Requests", "Request Header Fields Too Large", "No Response (Nginx)", "Retry With (Microsoft)",
                          "Blocked by Windows Parental Controls (Microsoft)", "Client Closed Request (Nginx)"] }

  let(:server) { [500, 501, 502, 503, 504, 505, 506, 507, 508, 509,
                  510, 511, 598, 599] }
  let(:server_message) { ["Internal Server Error", "Not Implemented", "Bad Gateway", "Service Unavailable",
                          "Gateway Timeout", "HTTP Version Not Supported", "Variant Also Negotiates (Experimental)",
                          "Insufficient Storage (WebDAV)", "Loop Detected (WebDAV)", "Bandwidth Limit Exceeded (Apache)",
                          "Not Extended", "Authentication Required", "Network read timeout error", "Network connect timeout error"] }

  it "should raise an error if the status_code is missing" do
    expect{Pstatus.get_status_msg(nil)}.to raise_error("Missing parameter status_code.")
  end

  it "should raise an error if the status_code does not exist" do
    expect{Pstatus.get_status_msg(4042)}.to raise_error("This status code does not exist. Please check again!")
  end

  it "should display the success messages" do
    success.each_with_index do |s, i|
      expect(Pstatus.get_status_msg(s)).to eq(success_message[i])
    end
  end

  it "should display the information messages" do
    information.each_with_index do |s, i|
      expect(Pstatus.get_status_msg(s)).to eq(information_message[i])
    end
  end

  it "should display the redirection_messages" do
    redirection.each_with_index do |s, i|
      expect(Pstatus.get_status_msg(s)).to eq(redirection_message[i])
    end
  end

  it "should display the client messages" do
    client.each_with_index do |s, i|
      expect(Pstatus.get_status_msg(s)).to eq(client_message[i])
    end
  end

  it "should display the server messages" do
    server.each_with_index do |s, i|
      expect(Pstatus.get_status_msg(s)).to eq(server_message[i])
    end
  end
end
