module RemoteActiveModel
  class RamError < StandardError
    def message
      self.class::MESSAGE
    end
  end

  class NoUrlError < RamError
    MESSAGE = 'options should includes :url!'.freeze
  end

  class NoNameError < RamError
    MESSAGE = 'options should includes :name!'.freeze
  end
end
