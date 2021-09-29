def decode_char(string)
  string2 = "#{string} "
  code_index = { '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F', '--.' => 'G',
                 '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N',
                 '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S', '-' => 'T', '..-' => 'U',
                 '...-' => 'V', '.--' => 'W', '-..-' => 'X', '-.--' => 'Y', '--..' => 'Z' }
  arrays = { 'big' => [], 'small' => [] }
  spaces = { 'space_detect' => false, 'over_space_detect' => true }
  string2.each_char do |e|
    if ['.', '-'].include?(e)
      spaces = { 'space_detect' => false, 'over_space_detect' => true }
      arrays['small'].push(e)
    elsif spaces['space_detect'] == false
      arrays['big'].push(code_index[arrays['small'].join])
      arrays['small'] = []
      spaces['space_detect'] = true
    elsif spaces['over_space_detect']
      arrays['big'].push(' ')
      spaces['over_space_detect'] = false
    end
  end
  print arrays['big'].join
end

decode_char('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-. / .-. ..- -... .. . ...')
