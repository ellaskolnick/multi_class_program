require 'diary_entry'

RSpec.describe DiaryEntry do
  context "when title is called" do
    it "returns the title of the entry" do
      diary_entry = DiaryEntry.new("1", "one")
      expect(diary_entry.title).to eq "1"
    end
  end

  context "when contents is called" do
    it "returns the contents of the entry" do
      diary_entry = DiaryEntry.new("1", "one")
      expect(diary_entry.contents).to eq "one"
    end
  end

  context "when contents is not empty" do
    it "returns the number of words in the contents" do
      diary_entry = DiaryEntry.new("1", "one")
      expect(diary_entry.word_counter).to eq 1
    end

    it "returns the number of words in the contents" do
      diary_entry = DiaryEntry.new("1", "one two three four five")
      expect(diary_entry.word_counter).to eq 5
    end
  end

  context "when contents is empty" do
    it "returns 0" do
      diary_entry = DiaryEntry.new("1", "")
      expect(diary_entry.word_counter).to eq 0
    end

    it "returns 0" do
      diary_entry = DiaryEntry.new("1", " ")
      expect(diary_entry.word_counter).to eq 0
    end
  end
end
