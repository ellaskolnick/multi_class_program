require 'diary'
require 'diary_entry'
require 'contacts'

RSpec.describe "Diary Integration" do
  context "when reading all entries and it has one entry" do
    it "returns an array of the entry" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("1", "hi, how are you?")
      diary.add(diary_entry)
      expect(diary.all).to eq [diary_entry]
    end
  end

  context "when reading all entries and there are multiple entries" do
    it "returns an array of all the entries" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("1", "hi, how are you?")
      diary_entry2 = DiaryEntry.new("1", "one two three for five")
      diary.add(diary_entry)
      diary.add(diary_entry2)
      expect(diary.all).to eq [diary_entry, diary_entry2]
    end
  end
  context "when there is only one diary entry to read" do
    it "returns that entry" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("1", "hi, how are you?")
      diary_entry2 = DiaryEntry.new("2", "one two three four five")
      diary.add(diary_entry)
      diary.add(diary_entry2)
      expect(diary.read_perfect_amount(1, 4)).to eq diary_entry
    end
  end

  context "when there are a few diary entries to read" do
    it "returns the longest entry" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("1", "hi, how are you?")
      diary_entry2 = DiaryEntry.new("2", "one two three four five")
      diary.add(diary_entry)
      diary.add(diary_entry2)
      expect(diary.read_perfect_amount(1, 6)).to eq diary_entry2
    end
  end

  context "when there is no readable content" do
    it "returns nil" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("1", "hi, how are you?")
      diary_entry2 = DiaryEntry.new("1", "one two three four five")
      diary_entry3 = DiaryEntry.new("1", "one two three")
      diary.add(diary_entry)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      expect(diary.read_perfect_amount(1, 2)).to eq nil
    end
  end

  context "when wpm is smaller than or equal to 0" do
    it "fails" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("1", "hi, how are you?")
      diary_entry2 = DiaryEntry.new("1", "one two three four five")
      diary_entry3 = DiaryEntry.new("1", "one two three")
      diary.add(diary_entry)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      expect{ diary.read_perfect_amount(0, 5) }.to raise_error "WPM cannot be zero or smaller."
    end
  end

  context "when there are contacts in the diary" do
    it "returns an array of the phone numbers" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("1", "hi, how are you?")
      diary_entry2 = DiaryEntry.new("1", "one two three four five 07777777777")
      diary_entry3 = DiaryEntry.new("1", " 07777222938 one two three")
      diary.add(diary_entry)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      contacts = Contacts.new(diary)
      expect(contacts.all).to eq ["07777777777", "07777222938"]
    end
  end

  context "when there are no contacts in the diary" do
    it "returns an empty array" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("1", "hi, how are you?")
      diary.add(diary_entry)
      contacts = Contacts.new(diary)
      expect(contacts.all).to eq []
    end
  end
end
