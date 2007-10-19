#
#  Created by Luke Kanies on 2007-10-16.
#  Copyright (c) 2007. All rights reserved.

require 'uri'
require 'puppet/file_serving'
require 'puppet/file_serving/configuration'

module Puppet::FileServing::TerminusHelper
    def key2uri(key)
        # Return it directly if it's fully qualified.
        if key =~ /^#{::File::SEPARATOR}/
            key = "file://" + key
        end

        begin
            uri = URI.parse(URI.escape(key))
        rescue => detail
            raise ArgumentError, "Could not understand URI %s: %s" % [key, detail.to_s]
        end
    end
end
