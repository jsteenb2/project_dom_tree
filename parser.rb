#parser.rb



  #parses string into hash/struct containing key attributes using Regex

  # "<p class='foo bar' id='baz' name='fozzie'>"

  # <p
  # class='foo bar'
  # id='baz'
  # name='fozzie'>

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

  parse_tag("<p class='foo bar' type='' id='baz' name='fozzie'>")
