#
# Cookbook:: stateofthemap
# Recipe:: container
#
# Copyright:: 2022, OpenStreetMap Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "podman::apache"

podman_site "stateofthemap.org" do
  image "ghcr.io/openstreetmap/stateofthemap-website:latest"
  aliases ["www.stateofthemap.org", "stateofthemap.com", "www.stateofthemap.com", "sotm.org", "www.sotm.org"]
end

%w[2007 2008 2009 2013 2016 2017 2018 2019 2020 2021 2022 2024 2025].each do |year|
  podman_site "#{year}.stateofthemap.org" do
    image "ghcr.io/openstreetmap/stateofthemap-#{year}:latest"
    aliases ["#{year}.stateofthemap.com", "#{year}.sotm.org"]
  end
end

podman_site "stateofthemap.eu" do
  image "ghcr.io/openstreetmap/stateofthemap-eu-website:latest"
  aliases ["www.stateofthemap.eu"]
end
