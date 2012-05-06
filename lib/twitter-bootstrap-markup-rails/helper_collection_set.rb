module Twitter::Bootstrap::Markup::Rails
  class HelperCollectionSet
    attr_accessor :collections

    def initialize(view, items)
      @collections = {}
      items.each do |item|
        @collections[item] = Twitter::Bootstrap::Markup::Rails::HelperCollection.new(view)
        instance_eval <<-EOF
          def #{item}
            yield @collections[#{item.inspect}]
          end
        EOF
      end
    end
    
  end
end
