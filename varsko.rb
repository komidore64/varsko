def weechat_init
  Weechat.register("varsko", "komidore64", "0.0.1", "GPL3", "a notify-send script for private messages and highlights", "", "")

  Weechat.hook_print("", "", "", 1, "message_bro", "")

  return Weechat::WEECHAT_RC_OK
end

def message_bro(data, buffer, date, tags, visible, highlight, nick, message)

  buf_name = Weechat.buffer_get_string(buffer, "short_name") ||
    Weechat.buffer_get_string("name")

  is_private_message = (Weechat.buffer_get_string(buffer, "localvar_type") == "private") &&
    (buf_name == nick)
  is_highlight = highlight == "1"

  if is_private_message || is_highlight
    `notify-send "#{nick}" "#{message}"`
  end

  return Weechat::WEECHAT_RC_OK

end
