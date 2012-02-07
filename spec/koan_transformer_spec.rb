require "./koan_transformer.rb" 
describe KoanTransformer do
  describe "the regexp for transforming the koans" do
    pattern = KoanTransformer::MethodRegex 
   # pattern = /^(\s*)def\s*([^\s]*)\s*$/
    line = "  def test_character_classes_give_options_for_a_character"
    kt = KoanTransformer.new
    
    it "should match the def line" do
      (pattern =~ line).should == 0
    end
    it "should select the def and the name" do
      md = pattern.match(line)
      md[1].should == "  "
      md[2].should == "test_character_classes_give_options_for_a_character"   
    end
    it "should replace the def with proper it" do
      kt.transformline(line).should == "  it \"character classes give options for a character\" do"
    end
    it "should throw away the require" do
      require_line ="require File.expand_path(File.dirname(__FILE__) + '/edgecase')"
      kt.transformline(require_line).should == '__ = "FILL_ME_IN"'     
    end
    it "should transform the class" do
      class_line = "class AboutRegularExpressions < EdgeCase::Koan"
      kt.transformline(class_line).should == 'describe "RegularExpressionsKoan" do'          
    end
    it "should transform the assert" do
       assert_line = '  assert_equal __, "some matching content"[/match/]'
       kt.transformline(assert_line).should == '   "some matching content"[/match/].should == __'
      
    end
  
  end
end