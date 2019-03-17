require 'erb'

template='
windows:
    <% if @commands.length > 10 %>
  - name: "02"
    root: ~/
    layout: tiled
    panes:<% @commands.slice(10,30).each do |cmd| %>
      - commands:
        - <%= cmd %><% end %><% end %>
  - name: "01"
    root: ~/
    layout: tiled
    panes:<% @commands.slice(0,9).each do |cmd| %>
      - commands:
        - <%= cmd %><% end %>
'


read_lines=[]
# read lines from stdin
while a_line = gets
  read_lines << a_line
end

if read_lines.length > 30
    abort('more than 30 host matched; exiting!')
end

@commands=read_lines

renderer = ERB.new(template)
output = renderer.result()

puts output

