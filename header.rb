class Convert_headers
  def html_headers(line)
    num = line.count('#')
    line.delete!('#').strip!
    "<h#{num}>#{line}</h#{num}>\n\n"
  end
end
