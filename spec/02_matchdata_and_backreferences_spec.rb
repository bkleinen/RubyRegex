describe "regex backreferences" do
  # () defines a group in a regex, they can be backreferenced in several ways:
  it "can be accessed via global variables" do
    str ="can be accessed via global variables"
    if /(\w*) (\w*) (\w*) (\w*)/ =~ str 
      "#{$2} #{$1} #{$4} #{$3}".should == "be can via accessed"
    end
  end
  it "in gsub you can use \\1" do
    str ="can be accessed via global variables"
    str.gsub(/(\w*) (\w*) (.*)/,"\\1't they \\3 \\1 they.").should == "can't they accessed via global variables can they."   
  end
  it "Matchdata makes it more Object-Oriented" do
    AssertRegex = /^(\s*)assert_equal __,(.*)/
    md= AssertRegex.match('assert_equal __, "Gray, James"[/(\w+), (\w+)/, 2]')  
    line = md[1]+md[2]+".should == __" 
    line.should == " \"Gray, James\"[/(\\w+), (\\w+)/, 2].should == __"  
  end
  
end
