@morse = [
  '.-', '-...', '-.-.', '-..', '.', '..-.', '--.', '....',
  '..', '.---', '-.-', '.-..', '--', '-.', '---', '.--.',
  '--.-', '.-.', '...', '-', '..-', '...-', '.--', '-..-',
  '-.--', '--..'
]

@abc = 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
       'W', 'X', 'Y', 'Z'

def decode_word(word)
  decoded_word = ''
  word_splitted = word.split
  word_splitted.each do |w|
    decoded_word += decode_char(w)
  end
  decoded_word
end

def decode_char(char)
  @morse.each_with_index do |m, idx|
    return (@abc[idx]).to_s if m == char
  end
end

def decode(message)
  chars = message.chars
  chars.each_with_index do |m, idx|
    message[idx] = ' ' if m != '.' && m != '-' && m != ' '
  end
  decoded_message = ''
  message_splitted = message.split('   ')
  message_splitted.each do |m|
    decoded_message = "#{decoded_message} #{decode_word(m)}"
  end
  decoded_message
end

print decode('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-. / .-. ..- -... .. . ...')
