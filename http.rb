module HTTP
	class Request
		#variables d'instances
		attr_accessor :headers, :body, :path

		#constructeur
		def initialize(socket)
    		   #parse_socket(socket)
		   @headers = {}
		   @body = ""
		   @path = ""
		end 

		#premiere ligne de la requete avant le header


		#scan du socket entier et recuperation des differents elements
		def parse_socket(socket)
		   if (socket.size != 0 )
		      #on a bien une requete avec des elements

		   else
		      #la requete est vide

		   end
		end

	end

	class Response
		#variables d'instances
		attr_accessor :headers, :body, :path, :code, :code_message

		#constructeur
		def initialize()
		   @headers = {}
		   @body = ""
		   @path = ""
		   @code = ""
		   @code_message = ""  
		end 

		def write(string)
			@body += string
		end

		#permet de fabriquer le header + body du socket
		def to_s
		   res = "#{@code}"
		   res += " #{@code_message}"
		   #res += "#{@path}\n"
		   @headers.each do |k, v|
		      res += "\n#{k}: #{v}"
		   end
		   res += "\n\n#{@body}\n"
		   #on doit rajouter un \n final car stringio en genere un 
		end
	end
end

