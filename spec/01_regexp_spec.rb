describe "Regular Expressions in Ruby" do
# see http://www.ruby-doc.org/core-1.9.3/Regexp.html

  it "are built into the language" do
    (/ab/ =~ "abcd").should == 0
    ("abcd" =~ /bc/).should == 1
  end
  
  it "Regular expressions can be created in various ways" do
    /Ruby/.class.should == Regexp
    Regexp.new("Ruby").class.should == Regexp
    %r(RUBY).class.should == Regexp
   ( %r|ruby| =~ "ruby").should == 0
   
   options = Regexp::MULTILINE | Regexp::IGNORECASE
   pat1 = Regexp.compile("foo",options) # synonymous to Regexp.new
   (pat1 =~ "hallo\nxFoobar").should == 7
  end

  it "can ignore case" do
    (/ruby/i =~ "Ruby").should == 0
  end
  
  it "have predefined classes \\d \\w \\s" do
    (/\w\w\d\d\s\w/ =~ "ab12 x").should == 0
  end
  
  it "dot matches any character" do
    regex = /./
    ('A'..'z').each do | c |
      (regex =~ c).should == 0
    end
  end
  
end
