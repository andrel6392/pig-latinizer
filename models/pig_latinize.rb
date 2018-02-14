class PigLatinizer
    
    attr_reader :pl_song, :pl_artist, :pl_lyrics
    
    def initialize(song,artist,lyrics)
        @pl_song = pig_latinize(song)
        @pl_artist = pig_latinize(artist)
        @pl_lyrics = pig_latinize(lyrics)
    end
    
    def pig_latinize(sentence)
      sentence = sentence.downcase
      vowels = ['a', 'e', 'i', 'o', 'u']
      words = sentence.split(' ')
      result = []
    
      words.each_with_index do |word, i|
          translation = ''
          qu = false
          if vowels.include? word[0]
              translation = word + 'ay'
              result.push(translation)
          else
              word = word.split('')
              count = 0
              word.each_with_index do |char, index|
                  if vowels.include? char
                      # handle words that start with 'qu'
                      if char == 'u' and translation[-1] == 'q'
                          qu = true
                          translation = words[i][count + 1..words[i].length] + translation + 'uay'
                          result.push(translation)
                          next
                      end
                      break
                  else
                      # handle words with 'qu' in middle
                      if char == 'q' and word[i+1] == 'u'
                          qu = true
                          translation = words[i][count + 2..words[i].length] + 'quay'
                          result.push(translation)
                          next
                      else
                          translation += char
                      end
                      count += 1
                  end
              end
              # translation of consonant words without qu
              if not qu
                  translation = words[i][count..words[i].length] + translation + 'ay'
                  result.push(translation)
              end
          end
      
      end
      result.join(' ')
    end
    
end