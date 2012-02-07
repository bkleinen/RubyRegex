describe "Character Classes" do
  it "[ax] matches any character in the brackets" do
    (/[aeiou]*/i =~ "Eiersalat").should == 0
  end
  it "^ negates the class" do
    "Eiersalat"[/[^aeiou]/i].should == 'r'
  end
  it "can use ranges" do
    "abcdefg"[/([b-z])+/].should =='bcdefg' 
  end
  it "can use ranges II" do
    /([b-d])+/.match("abcdefg")[0].should =='bcd'   
  end
end