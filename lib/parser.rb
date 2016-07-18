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
    tag_type = html.match(/<(\/\w*)>/).captures[0]
    regex = /[a-z]+\s*='[\w\s]*'/
    elements = html.scan(regex)
    attribute_hash = attr_adder(elements)
    Tag.new(:tag_type => tag_type, :attributes => attribute_hash)
  end

  def attr_adder(attributes)
    attributes = {}
    attributes.each do |info|
      clazz = info.match(/([a-z]*)=/).captures[0]
      clazz_val = info.match(/'(.*)'/).captures[0]
      attributes[clazz] = clazz_val
    end
    attributes
  end

end

# html_string = "<div>  div text before  <p>    p text  </p>  <div>    more div text  </div>  div text after</div>"
# p
# a_hash = parse_tag("<p class='foo bar' type='' id='baz' name='fozzie'>")
# p HTMLParser.new(html_string).parse_tag(html_string)
# p HTMLParser.new(html_string).parse_tag(html_string).attributes
