class KoanTransformer
  MethodRegex = /^(\s*)def\s*([^\s]*)\s*$/
  RequireRegex = /^\s*require/
  ClassRegex = /^\s*class/
  AssertRegex = /^(\s*)assert_equal __,(.*)/
  
  def transformline(line)
    return '__ = "FILL_ME_IN"' if RequireRegex =~ line
    return "describe \"RegularExpressionsKoan\" do" if ClassRegex =~ line
    md = MethodRegex.match(line)
    return  md[1]+"it \""+md[2].gsub("test_","").gsub(/_/," ")+'" do' if md
    md = AssertRegex.match(line)
    return md[1]+md[2]+".should == __" if md  
    return line
  end
  def transform
    File.open("spec/92_regex_koan_spec.rb","w") do | output |
      File.foreach("spec/91_regex_koans.rb") do | line |
        output.puts transformline(line)
      end
    end
  end
end

KoanTransformer.new.transform

