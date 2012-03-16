#   Copyright 2011-2012 Jacob Beard, INFICON, and other SCION contributors
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

define ['fs'],(fs) ->
    getMemory : (pid) ->
        s = fs.readFileSync("/proc/#{pid}/status",'utf8')
        rssTuple = s.split('\n')[14].split(/\s+/)
        if not (rssTuple[0] is 'VmRSS:')
            #console.error "Received something weird from /proc/#{pid}/status"
            #console.error s
            return 0
        else
            return parseInt rssTuple[1]
