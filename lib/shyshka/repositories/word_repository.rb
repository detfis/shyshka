class WordRepository < Hanami::Repository
  associations do
    has_many :examples
  end

  def create_with_examples(data)
    assoc(:examples).create(data)
  end

  def add_example(word, data)
    assoc(:examples, word).add(data)
  end    

  def find_with_examples(id)
    aggregate(:examples).where(id: id).as(Word).one
  end
end
