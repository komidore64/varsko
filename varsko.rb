# Varsko Weechat Script
# Receive libnotify notifications when you get a private message or your nick is mentioned
#
# Copyright (C) 2013 Adam Price (komidore64[at]gmail[dot]com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
# "varsko" is Swedish for "notify" or "warn"
#
# For this script to work properly, you will need libnotify installed

# ==============================
# helper methods
#
def buffer_name(buffer)
  return Weechat.buffer_get_string(buffer, "short_name") ||
    Weechat.buffer_get_string(buffer, "name")
end

def is_private_message?(buffer, nick)
  return Weechat.buffer_get_string(buffer, "localvar_type") == "private" &&
    buffer_name(buffer) == nick
end

def is_highlight?(hl)
  return (hl == "1")
end

def have_dependencies?
  return system("which notify-send > /dev/null 2>&1")
end
# ==============================


# ==============================
# initialization
#
def weechat_init
  if !have_dependencies?
    Weechat.print("'notify-send' command not found")
    return Weechat::WEECHAT_RC_ERROR
  end

  Weechat.register(
    "varsko",
    "komidore64",
    "0.0.3",
    "GPL3",
    "a notify-send script for private messages and highlights",
    "",
    ""
  )

  Weechat.hook_print("", "", "", 1, "message_bro", "")

  return Weechat::WEECHAT_RC_OK
end
# ==============================


# ==============================
# hook
#
def message_bro(data, buffer, date, tags, visible, highlight, nick, message)

  if is_private_message?(buffer, nick) || is_highlight?(highlight)
    `notify-send "#{nick}" "#{message}"`
  end

  return Weechat::WEECHAT_RC_OK
end
# ==============================
