require 'socket'

port = 8080
server = TCPServer.open(port)
  $tab_session = {}

class String
  def self.random(size=20)
    set = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    (1..size).map{ set[rand(set.length)] }.join
  end
end

def generate_cookie
  require 'digest/md5'
    Digest::MD5.hexdigest("cooooookiiiie"+String.random)
end


trap('EXIT'){ server.close } #EXIT : invoked just prior to program termination
loop do
  socket = server.accept
  puts "lololo"

  # request parsing
  request = socket.gets
  headers = {}
  begin
    header = socket.gets
    header_name, header_val = header.chomp.split(': ')
    headers[header_name] = header_val
  end until header.chomp.empty?

  body = nil
  unless headers["Content-Length"].nil?
    body = socket.read(headers["Content-Length"].to_i)
    socket.puts body
  end
  puts "request = #{request}"
  puts "headers = #{headers.inspect}"
  puts "body = #{body}"

  # test sur le cookie s'il existe pas
  # s'il est dans la requete, l'implémenter
  # sinon créer 
  if headers['Cookie'].nil?
    num_session = rand(20)
    $tab_session[num_session] = 1
  else
     num_session = headers['Cookie'].split('=')[1].to_i
     puts num_session
     puts $tab_session
     $tab_session[num_session] += 1
  end

  # response code
  socket.puts("200 HTTP/1.1 ok")
  # response headers
  response_body = [request, headers.inspect, body].join("\n")
  response_body += "nombre de connexion : #{$tab_session[num_session]} \n"
  socket.puts("Set-Cookie: num_session=#{num_session}")
  socket.puts("Content-Length: #{response_body.length}")
  socket.puts("Content-Type: text/plain")
  socket.puts
  # response body
  socket.write response_body

  
  socket.close
end

trap('INT') { puts "\nexiting" ; exit } # INT: CTRL+C
