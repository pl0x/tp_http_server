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

	describe '#path' do
	end

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
  end
	#test sur le constructeur
	context "When just created" do
	  its(:headers) {should  == {}}
	  its(:body) {should == ""}
	  its(:path) {should == ""}
	  its(:code) {should == ""}
	  its(:code_message) {should == ""}
	end

	describe '#write' do
	end

	describe '#to_s' do 
	end
end
