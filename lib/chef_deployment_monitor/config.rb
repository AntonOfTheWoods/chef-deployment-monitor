#
# Author:: Sander Botman (<sander.botman@gmail.com>)
# Copyright:: Copyright (c) 2014 Sander Botman.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'mixlib/config'

class Chef
  class Deployment
    class Monitor
      class Config
        extend Mixlib::Config
        config_strict_mode true

        default :blacklisted?, Proc.new { |data| false } # rubocop:disable Lint/UnusedBlockArgument:
        default :marker_file, '/tmp/last_chef_deployment'
        default :history_file, '/tmp/lasts_chef_deployment'
        default :history_file_size, 1000
        %w(
      mon_file
      log_dir
      pid_dir
        ).each { |o| configurable o.to_sym }
      end
    end
  end
end
