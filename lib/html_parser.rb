require 'pry'
Tag = Struct.new(:type, :attributes, :children)

class HTMLParser
  attr_reader :html

  def initialize(html_text)
    raise ArgumentError unless html_text.is_a? String
    @html = html_text
    @dom = []
  end

  def parse_html(html)
    regex = /(.+)<.*>(.+)/
    elements = html.scan(regex)
  end

  def parse_tag(html_input)
    raise ArgumentError unless html_input.is_a? String
    tag_regex = /<([a-zA-z]+)/
    tag_type = html_input.match(tag_regex).captures[0]
    attr_regex = /[a-z]+\s*='[\w\s]*'/
    elements = html.scan(attr_regex)
    attribute_hash = attr_adder(elements)
    Tag.new(tag_type, attribute_hash)
  end

  def attribute_splitter(input_hash)
    input_hash.each do |key, value|
      if value.count(" ") > 0
        attributes = value.split(" ")
        value = attributes
      end
      input_hash[key] = value
    end
    input_hash
  end

  def attr_adder(attributes)
    attributes_hash = {}
    attributes.each do |info|
      clazz = info.match(/([a-z]*)=/).captures[0]
      clazz_val = info.match(/'(.*)'/).captures[0]
      attributes_hash[clazz] = clazz_val
    end
    attributes_hash = attribute_splitter(attributes_hash)
    attributes_hash
  end

end
