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
  
  
  
end