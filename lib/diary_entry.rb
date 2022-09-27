class DiaryEntry
  attr_reader :title, :contents
  def initialize(title, contents)
    #title and contents
    @title = title
    @contents = contents
  end

  def word_counter
    # counts how many words in an entry
    @contents.split(" ").count
  end
end
