#parser.rb
require 'ostruct'

Tag = Struct.new(:type, :attributes, :children)

class HTMLLoader

  def load_file(file)

  end
end

class HTMLParser

  def initialize(html_text)
    @html = html_text
    @dom = []
  end

  def parse_tag(html)
    attr_hash = {}
    tag = {:attributes => nil, :tag_type => nil}
    tag[:tag_type] = html.match(/<(\/\w*)>/).captures[0]
    regex = /[a-z]+\s*='[\w\s]*'/
    elements = html.scan(regex)
    elements.each do |info|
      clazz = info.match(/([a-z]*)=/).captures[0]
      clazz_val = info.match(/'(.*)'/).captures[0]
      attr_hash[clazz] = clazz_val
    end
    tag[:attributes] = attr_hash
    # puts "hash is #{attr_hash}"
    # p tag
    Tag.new(tag[:tag_type], tag[:attributes])
  end

  def attr_adder(attributes)

  end

end

html_string = "<div>  div text before  <p>    p text  </p>  <div>    more div text  </div>  div text after</div>"

# a_hash = parse_tag("<p class='foo bar' type='' id='baz' name='fozzie'>")
p HTMLParser.new(html_string).parse_tag(html_string)
p HTMLParser.new(html_string).parse_tag(html_string).attributes
