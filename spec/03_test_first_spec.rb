# you could just use 
# http://rubular.com/
# but if you need a regexp within a program, it's better to unit test it:

describe "write specs for regexes" do
  
  regexp = /href="([^"']+)"\s*>([^<]*)</
  context "anchor tag regexp" do
    it "should match HTW" do
      m = regexp.match('<a href="http://www.htw-berlin.de">HTW Berlin</a>')
      m.should_not be_nil
      m[1].should == "http://www.htw-berlin.de"
      m[2].should == "HTW Berlin"
    end
  
    it "should match Berlinale" do
      m = regexp.match('<a  href="http://berlinale.de">Berlinale</a>')
      m.should_not be_nil
      m[1].should == "http://berlinale.de"
      m[2].should == "Berlinale"
    end
  
    it "should not match non anchor tags" do
      pending "implement this and add example for more than one space after a"
      m = regexp.match('<img href="http://berlinale.de">Berlinale</a>')
       m.should be_nil
    end
  end
end
