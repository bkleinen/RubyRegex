describe "quantifiers" do
  it "an item followed by an ? is optional" do
    pattern = /jpe?g/
    (pattern =~ "jpg").should == 0
    (pattern =~ "jpeg").should == 0
    (pattern =~ "jppg").should == nil    
  end
  it "+ means once or more" 
  it "* means zero or more" 
  
  it "there are also comma-separated ranges" do
     extensions = /\b\w{3,4}\b/
    (extensions =~ "jpg").should == 0 
    (extensions =~ "jpeg").should == 0 
    (extensions =~ "jpegs").should == nil 
    (extensions =~ "it").should == nil
  end
  it "are greedy by default" do
    str = "Where the sea meets the moon-blanched land"
    md = /.*the/.match(str)
    md[0].should == "Where the sea meets the"
  end
  it "but can be made non-greedy" do
    str = "Where the sea meets the moon-blanched land"
    md = /.*?the/.match(str)
    md[0].should == "Where the"
  end
  
  
end