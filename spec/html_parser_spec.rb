require 'spec_helper'
require 'html_parser'
require 'pry'

describe HTMLParser do

  let(:single_tag) { HTMLParser.new("<p class='foo bar' type='' id='baz' name='fozzie'>") }
  let(:dom) { HTMLParser.new("<div>
                                div text before
                                <p>
                                  p text
                                </p>
                                <div>
                                  more div text
                                </div>
                                div text after
                              </div>") }

  # ------------------------------------
  # #initialize
  # ------------------------------------


  describe '#initialize' do

    it 'accepts an HTML tag string as the first parameter' do
      expect { single_tag }.to_not raise_error
    end


    it "sets the html attribute when passed correctly" do
      expect(HTMLParser.new("Foo html").html).to eq("Foo html")
    end


    it 'raises an ArgumentError when no name is passed' do
      expect { HTMLParser.new }.to raise_error(ArgumentError)
    end


    it 'raises an ArgumentError when name is not a string' do
      expect { HTMLParser.new([]) }.to raise_error(ArgumentError)
    end
  end

  # ------------------------------------
  # #parse_tag
  # ------------------------------------

  describe '#parse_tag' do
    let(:p_tag) { single_tag.parse_tag("<p class='foo bar' type='' id='baz' name='fozzie'>") }
    let(:div_tag) { single_tag.parse_tag("<div class='foo bar' type='' id='baz' name='fozzie'>") }

    it 'raises error when not given any input' do
      expect { single_tag.parse_tag }.to raise_error ArgumentError
    end

    it 'will raise error when given non-string html input' do
      expect { single_tag.parse_tag([]) }.to raise_error ArgumentError
    end

    it 'will not raise error when given correct tag input html' do
      expect { p_tag }.to_not raise_error
    end

    it 'will return a valid Tag' do
      expect(p_tag).to be_a Tag
    end

    it 'will instantiate Tag with correct tag type = p' do
      expect(p_tag.type).to eq("p")
    end

    it 'will instantiate Tag with correct tag type = div' do
      expect(div_tag.type).to eq("div")
    end

    it 'will instantiate Tag with attribute hash' do
      expect(p_tag.attributes).to be_a Hash
    end

    it 'will create attributes hash from input tag' do
      expect(p_tag.attributes["id"]).to eq("baz")
    end

  end

  # ------------------------------------
  # #attribute_splitter
  # ------------------------------------

  describe '#attribute_splitter' do
    let(:p_tag) { single_tag.parse_tag("<p class='foo bar' type='' id='baz' name='fozzie'>") }
    let(:name_tag) { HTMLParser.new("blah").parse_tag("<div class='foo bar' type='' id='baz' name='fozzie wozzie was a bear'>") }

    it 'will return a hash' do
      attributes = p_tag.attributes
      expect(single_tag.attribute_splitter(attributes)).to be_a Hash
    end

    it 'will split attributes with multiple attrbs' do
      expect(p_tag.attributes["class"]).to eq(["foo", "bar"])
    end

    it 'will split attributes with multiple attrbs' do
      expect(name_tag.attributes["name"]).to eq(%w[fozzie wozzie was a bear'])
    end
  end
end
