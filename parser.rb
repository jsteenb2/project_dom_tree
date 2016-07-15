#parser.rb
require 'pry'

Tag = Struct.new(:type, :attributes, :children)


class HTMLParser
  attr_reader :html, :head

  def initialize(html_text)
    #array of our lines without the <!doctype> tag
    @html = File.readlines(html_text).map(&:strip)[1..-1]#.gsub!("\n", "")
    
    @head = parse_tag(@html[0])
  end

  #creates a Tag node from String
  def parse_tag(html)
    attr_hash = {}
    tag = {:attributes => nil, :tag_type => nil}
    tag[:tag_type] = html.match(/<([\/\w]*)/).captures[0]
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
    Tag.new(tag[:tag_type], tag[:attributes], nil)
  end

  #create
  def go_through_levels
    arr = []
    current = @head
    @html.each do | layer | 
      if parse_tag(layer).tag_type != current.tag_type
      arr << layer
      end
      #binding.pry
    end
  end
  
end



file = HTMLParser.new("test.html")

#puts file.head
p
#puts file.html[4]
puts file.parse_tag(file.html[4])

p
# puts file.html[0]
# puts file.html[1]
# puts file.html[2]
# puts file.html[3]

#p HTMLParser.new("test.html")#.parse_tag(html_string).attributes

