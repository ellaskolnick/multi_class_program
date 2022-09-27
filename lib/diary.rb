class Diary
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add(entry)
    # add an instance of diary  entry to diary
    @entries << entry
  end

  def all
    # see all of the diary entr ies
    @entries
  end

  def read_perfect_amount(wpm, minutes)
    # selects a diary entry based on wpm and mins
    # filter the entries by if they fit the reading time
    # find the perfect amount of words by wpm * minute
    # check if that is equal to the number of words in each entry
    fail "WPM cannot be zero or smaller." if wpm <= 0
    readable?(wpm, minutes).max_by{ |entry| entry.word_counter }
  end

  private

  def readable?(wpm, minutes)
    @entries.filter{ |entry| entry.word_counter <= wpm * minutes }
  end
end
