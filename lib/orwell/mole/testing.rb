require 'orwell/mole/transport/mock'

Mole.config { |c| c.method = :mock }

module Mole
  class Transporter
    alias_method :orig_lookup, :lookup

    def lookup(transport)
      return Transport::Mock.new if transport == :mock
      orig_lookup(transport)
    end
  end
end
