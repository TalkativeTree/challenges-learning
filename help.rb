DICT_SET ={ :direction=>['north','south','east','west'],
            :verb=>['go', 'stop', 'kill', 'eat'],
            :stop=>['the', 'in', 'of', 'from', 'at', 'it'],
            :nouns=>['door', 'bear', 'princess', 'cabinet']
          }

def word_type(word)
  return :number if word.to_i > 0

  DICT_SET.each do |type,words|
    if words.include?(word)
      return type
    end
  end

  false
end