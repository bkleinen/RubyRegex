describe "using anchors" do
  it "^ and $ anchor to the beginning and end of a line" do
    string = "hallo\nruby"
    ( /allo/ =~ string ).should == 1
    ( /^allo/ =~ string ).should == nil
    ( /^hallo/ =~ string ).should == 0
    ( /^ruby/ =~ string ).should == 6 
  end
  it "\\A and \\Z match the beginning and end of the string:" do
    string = "hallo\nrubio"
    (/lo\Z/ =~ string).should == nil   
    (/io\Z/ =~ string).should == 9   
  end
  it "\\b matches a word boundary" do
    str = "slash b matches a word boundary"
    str.gsub(/\b/,"|").should == "|slash| |b| |matches| |a| |word| |boundary|"   
  end
  it "\\B matches everything BUT a word boundary" do
    str = "slash b matches a word boundary"
    str.gsub(/\B/,"-").should == "s-l-a-s-h b m-a-t-c-h-e-s a w-o-r-d b-o-u-n-d-a-r-y"
  end
  
end
