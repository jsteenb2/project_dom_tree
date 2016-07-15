#parser.rb
require 'ostruct'

tag = OpenStruct.new
#tag = Struct.new('tag', :attributes)


  def parse_tag(html)
    attr_hash = {}
    tag = {:attributes => nil, :tag_type => nil}
    tag[:tag_type] = html.match(/<(\w*)/).captures[0]
    # tag
    regex = /[a-z]+\s*='[\w\s]*'/
    elements = html.scan(regex)
    elements.each do |info|
      clazz = info.match(/([a-z]*)=/).captures[0]
      clazz_val = info.match(/'(.*)'/).captures[0]

      attr_hash[clazz] = clazz_val
    end
    tag[:attributes] = attr_hash
    # puts "hash is #{attr_hash}"
    p tag
  end

 def parse_tagE(html)
    puts "-----------------------------------------------------------"
    elements= html.scan(/[a-z]+\s*='[\w\s]*'/)

    puts "element is:: #{elements} \n"

    hash = {}
    hash[:tag] =html.match(/<(\w*)/).captures[0]
  
    elements.each do |info|
      clazz = info.match(/([a-z]*)=/).captures[0].to_sym
      clazz_val = info.match(/'(.*)'/).captures[0]

      hash[clazz] = clazz_val
    end

    hash

    print "hash is:: #{hash} \n"
    puts "-----------------------------------------------------------"
  end

a_hash = parse_tagE("<p class='foo bar' type='' id='baz' name='fozzie'>")
puts a_hash
#every key in the hash, assign it to tag"

# a_hash.each_key do |key|
#   tag.key = a_hash[key]
# end

# print tag
# puts tag.class
# puts tag.id










#print tag.name = "h[:attributes][0]"