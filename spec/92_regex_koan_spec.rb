# -*- coding: utf-8 -*-
__ = "FILL_ME_IN"

describe "RegularExpressionsKoan" do
  it "a pattern is a regular expression" do
     /pattern/.class.should == __
  end

  it "a regexp can search a string for matching content" do
     "some matching content"[/match/].should == __
  end

  it "a failed match returns nil" do
     "some matching content"[/missing/].should == __
  end

  # ------------------------------------------------------------------

  it "question mark means optional" do
     "abbcccddddeeeee"[/ab?/].should == __
     "abbcccddddeeeee"[/az?/].should == __
  end

  it "plus means one or more" do
     "abbcccddddeeeee"[/bc+/].should == __
  end

  it "asterisk means zero or more" do
     "abbcccddddeeeee"[/ab*/].should == __
     "abbcccddddeeeee"[/az*/].should == __
     "abbcccddddeeeee"[/z*/].should == __

    # THINK ABOUT IT:
    #
    # When would * fail to match?
  end

  # THINK ABOUT IT:
  #
  # We say that the repetition operators above are "greedy."
  #
  # Why?

  # ------------------------------------------------------------------

  it "the left most match wins" do
     "abbccc az"[/az*/].should == __
  end

  # ------------------------------------------------------------------

  it "character classes give options for a character" do
    animals = ["cat", "bat", "rat", "zat"]
     animals.select { |a| a[/[cbr]at/] }.should == __
  end

  it "slash d is a shortcut for a digit character class" do
     "the number is 42"[/[0123456789]+/].should == __
     "the number is 42"[/\d+/].should == __
  end

  it "character classes can include ranges" do
     "the number is 42"[/[0-9]+/].should == __
  end

  it "slash s is a shortcut for a whitespace character class" do
     "space: \t\n"[/\s+/].should == __
  end

  it "slash w is a shortcut for a word character class" do
    # NOTE:  This is more like how a programmer might define a word.
     "variable_1 = 42"[/[a-zA-Z0-9_]+/].should == __
     "variable_1 = 42"[/\w+/].should == __
  end

  it "period is a shortcut for any non newline character" do
     "abc\n123"[/a.+/].should == __
  end

  it "a character class can be negated" do
     "the number is 42"[/[^0-9]+/].should == __
  end

  it "shortcut character classes are negated with capitals" do
     "the number is 42"[/\D+/].should == __
     "space: \t\n"[/\S+/].should == __
     "variable_1 = 42"[/\W+/].should == __
  end

  # ------------------------------------------------------------------

  it "slash a anchors to the start of the string" do
     "start end"[/\Astart/].should == __
     "start end"[/\Aend/].should == __
  end

  it "slash z anchors to the end of the string" do
     "start end"[/end\z/].should == __
     "start end"[/start\z/].should == __
  end

  it "caret anchors to the start of lines" do
     "num 42\n2 lines"[/^\d+/].should == __
  end

  it "dollar sign anchors to the end of lines" do
     "2 lines\nnum 42"[/\d+$/].should == __
  end

  it "slash b anchors to a word boundary" do
     "bovine vines"[/\bvine./].should == __
  end

  # ------------------------------------------------------------------

  it "parentheses group contents" do
     "ahahaha"[/(ha)+/].should == __
  end

  # ------------------------------------------------------------------

  it "parentheses also capture matched content by number" do
     "Gray, James"[/(\w+), (\w+)/, 1].should == __
     "Gray, James"[/(\w+), (\w+)/, 2].should == __
  end

  it "variables can also be used to access captures" do
     "Name:  Gray, James"[/(\w+), (\w+)/].should == __
     $1.should == __
     $2.should == __
  end

  # ------------------------------------------------------------------

  it "a vertical pipe means or" do
    grays = /(James|Dana|Summer) Gray/
     "James Gray"[grays].should == __
     "Summer Gray"[grays, 1].should == __
     "Jim Gray"[grays, 1].should == __
  end

  # THINK ABOUT IT:
  #
  # Explain the difference between a character class ([...]) and alternation (|).

  # ------------------------------------------------------------------

  it "scan is like find all" do
     "one two-three".scan(/\w+/).should == __
  end

  it "sub is like find and replace" do
     "one two-three".sub(/(t\w*)/) { $1[0, 1] }.should == __
  end

  it "gsub is like find and replace all" do
     "one two-three".gsub(/(t\w*)/) { $1[0, 1] }.should == __
  end
end
