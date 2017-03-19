module Web::Controllers::Words
  class Index
    include Web::Action

    expose :words

    def call(params)
      @words = WordRepository.new.all
    end
  end
end
