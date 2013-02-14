require ('../http')
require ('stringio')

describe HTTP::Request do
  before(:each) do
#construction d'une requete factice
s = <<REQ
GET / HTTP/1.1
content_length 4

toto
REQ
  str = StringIO.new(s)
  @req = HTTP::Request.new(str) 
  end
	#test sur le constructeur
	context "When just created" do
	  it "tests headers" do 
            @req.headers.should_not be_nil
	  end
	  it "tests body" do
	    @req.body.should_not be_nil
	  end
	  it "tests path" do
	    @req.path.should_not be_nil
	  end	
	end

	#get+set sur attibut path
	describe '#path' do
           context "correct path" do
              it "should store a valid path" do 
              @req.path().should_not be_nil
              end
           end
	end
	#get+set sur attibut body
	describe '#body' do
           context "correct body" do
              it "should store a valid body" do 
              @req.body().should_not be_nil
              end
           end
	end
	#get+set sur attibut headers
	describe '#headers' do
           context "correct header" do
              it "should store a valid header" do 
              @req.headers().should_not be_nil
              end
           end
	end

	#scan du socket entier et recuperation des differents elements
	describe '#parse_socket' do
	end
end

describe HTTP::Response do
  before(:each) do
#construction d'une reponse factice
s = <<REQ
200 ok
content_length 4

toto
REQ
  str = StringIO.new(s)
 # @res = HTTP::Response.new(str) 
  end
	#test sur le constructeur
	context "When just created" do
	  its(:headers) {should  == {}}
	  its(:body) {should == ""}
	  its(:path) {should == ""}
	  its(:code) {should == ""}
	  its(:code_message) {should == ""}
	end

	#contraintes sur les attributs renvoyes : ne pas etre vide (tres permissif)
	#get+set sur attibut path
	describe '#path' do
           context "correct path" do
              it "should send a valid path" do 
              @res.path().should_not be_nil
              end
           end
	end
	#get+set sur attibut body
	describe '#body' do
           context "correct body" do
              it "should send a valid body" do 
              @res.body().should_not be_nil
              end
           end
	end
	#get+set sur attibut headers
	describe '#headers' do
           context "correct header" do
              it "should send a valid header" do 
              @res.headers().should_not be_nil
              end
           end
	end
	#get+set sur attibut code
	describe '#code' do
           context "correct code" do
              it "should send a valid code" do 
              @res.body().should_not be_nil
              end
           end
	end
	#get+set sur attibut code_message
	describe '#code_message' do
           context "correct code_message" do
              it "should send a valid code_message" do 
              @res.headers().should_not be_nil
              end
           end
	end



	describe '#write' do
	end

	describe '#to_s' do 
	end
end

