class Convert_ul
  def change_ul(line)
      md_string = ""
      line.each_line do |line|
      md_string << "  <li>#{line[2..-1].strip}</li>\n"
    end
      md_string.prepend("<ul>\n")<<"</ul>\n\n"
  end
end
