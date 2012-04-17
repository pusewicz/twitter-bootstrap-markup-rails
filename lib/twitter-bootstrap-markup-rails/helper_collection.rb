module Twitter::Bootstrap::Markup::Rails
  class HelperCollection
    attr_accessor :calls, :view

    def initialize(view)
      @view = view
      @calls = []
    end

    def method_missing(symbol, *args, &block)
      @calls << HelperMethodCall.new(@view, symbol, args, block)
    end

    def each
      @calls.each do |c|
        yield c
      end
    end

    def [](x)
      @calls[x]
    end

    def size
      @calls.size
    end

    def shift
      @calls.shift
    end
  end

  class HelperMethodCall
    attr_accessor :method, :options, :args

    def initialize(view, symbol, args, block)
      @view = view
      @method = symbol
      @options = args.extract_options!
      @args = args
      @block = block
    end

    def to_s
      args = @args
      args << @options

      if @block
        @view.send(@method, *args, &@block).html_safe
      else
        @view.send(@method, *args).html_safe
      end
    end

  end
end