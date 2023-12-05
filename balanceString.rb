str = "<><>{{{}}}[]<()>{}"

def balance_string(str)
  brackets = { "<" => ">", "{" => "}", "[" => "]", "(" => ")" }
  stack = []

  str.each_char do |char|
    if brackets.key?(char)
      stack.push(char)
    else
      return false if stack.empty? || brackets[stack.pop] != char
    end
  end

  stack.empty?
end
