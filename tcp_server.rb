require 'socket'

port = 8080
server = TCPServer.open(port)

# EXIT : invoked just prior to program termination
trap('EXIT'){ server.close } 
loop do
  socket = server.accept
  # socket.gets : lit une ligne entière
  # sockets.read(n) : lit n octets
  # socket.write string : écrit
  # socket.puts string : idem plus retour ligne

  premiere_ligne = socket.gets
  type, path, http_version = premiere_ligne.split(' ')

  #hash des paramètres de l'entete
  tab_param = {}
  begin ligne_vide
   #on parcourt toute la requete http jusqu'a la ligne vide
   header = socket.gets
   key, val = header.chomp.split(': ')
   tab_param[key] = val
  end until header.chomp.empty?

  body = nil
  unless tab_param["Content-Length"].nil?
    body = socket.read(tab_param["Content-Length"].to_i)
  end


  #response code
  socket.puts("200 HTTP/1.1 ok")
  
  #response headers
  body = "type = #{type}\n"
  body += "path = #{path}\n"
  body += "http = #{http_version}\n"
  tab_param.each do |name,val|
   body += "#{name}: #{val}\n"
  end
  #response body
  socket.puts("")
  socket.puts
  sowket.write
end

trap('INT') { puts "\nexiting" ; exit } # INT: CTRL+C

