#parser.rb



  #parses string into hash/struct containing key attributes using Regex

  "<p class='foo bar' id='baz' name='fozzie'>"

  # <p
  # class='foo bar'
  # id='baz'
  # name='fozzie'>

  def parse_tag(html)
    puts
    str = html.match(/<(.*)>/).captures[0]

     puts str 

     puts
    # regex = /<([a-z]*)/


    # type = html.match(regex)  
    # puts type
    # puts "type is #{type.captures[0]}"





  end

  parse_tag("<p class='foo bar' id='baz' name='fozzie'>")

