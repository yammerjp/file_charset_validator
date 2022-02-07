def get_encoding(encoding_string)
  if Encoding.const_defined? encoding_string
    Object.const_get("Encoding::#{encoding_string}")
  else
    nil
  end
end

def message str
  STDOUT.puts str
end
