
describe "positive and negative lookahead" do
  s1 = "New World Dictionary"
  s2 = "New World Symphony"
  s3 = "New World Order"
  it "positive lookahead" do
   reg = /New World(?= Dictionary| Symphony)/
    m1=reg.match(s1)
    m1[0].should == "New World"
    m3=reg.match(s3)
    m3.should == nil  
  end
  it "negative lookahead" do
     reg = /New World(?! Symphony)/
     m1=reg.match(s1)
     m1[0].should == "New World"
     m2=reg.match(s2)
     m2.should == nil
   end
end