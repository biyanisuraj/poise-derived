#
# Copyright 2016, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/node'

require 'poise_derived/lazy_attribute'


module PoiseDerived
  module DSL
    def _lazy_attribute(str=nil, &block)
      PoiseDerived::LazyAttribute.new(self, str, &block)
    end

    # Install the DSL addition globally.
    #
    # @return [void]
    def self.install
      Chef::Log.debug('[poise-derived] Installing node DSL')
      Chef::Node.prepend(self)
      alias_method(:lazy, :_lazy_attribute)
    end

    # Disable the DSL extension so `node.lazy` will no longer work.
    #
    # @return [void]
    def self.uninstall
      Chef::Log.debug('[poise-derived] Uninstalling node DSL')
      remove_method(:lazy)
    end
  end
end