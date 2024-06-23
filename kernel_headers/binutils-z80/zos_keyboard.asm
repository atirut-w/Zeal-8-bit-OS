
; SPDX-FileCopyrightText: 2023 Zeal 8-bit Computer <contact@zeal8bit.com>
;
; SPDX-License-Identifier: Apache-2.0

    .ifndef ZOS_KEYBOARD_H
    .set ZOS_KEYBOARD_H, 0

    ; This file represents the keyboard interface for a key input driver.

    ; kb_cmd_t: This group represents the IOCTL commands an input/keyboard driver should implement
    ; Set the current input mode, check the attributes in the group below.
    ; Parameters:
    ;   E - New mode
    .set KB_CMD_SET_MODE, 0

    ; Number of commands above
    .set KB_CMD_COUNT, 1

    ; kb_mode_t: Modes supported by input/keyboard driver
    ; In raw mode, all the characters that are pressed or released are sent to the user
    ; program when a read occurs.
    ; This means that no treatment is performed by the driver whatsoever. For example,
    ; if (Left) Shift and A are pressed, the bytes sent to the user program will be:
    ;    0x93          0x61
    ; Left shift   Ascii lower A
    ; The non-special characters must be sent in lowercase mode.
    .set KB_MODE_RAW, 0

    ; In COOKED mode, the entry is buffered. So when a key is pressed, it is
    ; first processed before being stored in a buffer and sent to the user
    ; program (on "read").
    ; The buffer is flushed when it is full or when Enter ('\n') is pressed.
    ; The keys that will be treated by the driver are:
    ;   - Non-special characters:
    ;       which includes all printable characters: letters, numbers, punctuation, etc.
    ;   - Special characters that have a well defined behavior:
    ;       which includes caps lock, (left/right) shifts, left arrow,
    ;       right arrow, delete key, tabulation, enter.
    ; The remaining special characters are ignored. Release key events are
    ; also ignored.
    .set KB_MODE_COOKED, 1

    ; HALFCOOKED mode is similar to COOKED mode, the difference is, when an
    ; unsupported key is pressed, instead of being ignored, it is filled in
    ; the buffer and a special error code is returned: ERR_SPECIAL_STATE
    ; The "release key" events shall still be ignored and not transmitted to
    ; the user program.
    .set KB_MODE_HALFCOOKED, 2

    ; Number of modes above
    .set KB_MODE_COUNT, 3

    ; kb_block_t: Blocking/non-blocking modes, can be ORed with the mode above
    ; In blocking mode, the `read` syscall will not return until a newline character ('\n')
    ; is encountered.
    .set KB_READ_BLOCK, 0 << 2

    ; In non-blocking mode, the syscall `read` can return 0 if there is no pending keys that were
    ; typed by the user. Please note that the driver must NOT return KB_RELEASED without a key following it.
    ; In other words, if the buffer[i] has been filled with a KB_RELEASED, buffer[i+1] must be valid
    ; and contain the key that was released.
    .set KB_READ_NON_BLOCK, 1 << 2

    ; The following codes represent the keys of a 104-key keyboard that can be detected by
    ; the keyboard driver.

    ; When the input mode is set to RAW, the following keys can be sent to the
    ; user program to mark which keys were pressed (or released).
    .set KB_KEY_A,'a'
    .set KB_KEY_B,'b'
    .set KB_KEY_C,'c'
    .set KB_KEY_D,'d'
    .set KB_KEY_E,'e'
    .set KB_KEY_F,'f'
    .set KB_KEY_G,'g'
    .set KB_KEY_H,'h'
    .set KB_KEY_I,'i'
    .set KB_KEY_J,'j'
    .set KB_KEY_K,'k'
    .set KB_KEY_L,'l'
    .set KB_KEY_M,'m'
    .set KB_KEY_N,'n'
    .set KB_KEY_O,'o'
    .set KB_KEY_P,'p'
    .set KB_KEY_Q,'q'
    .set KB_KEY_R,'r'
    .set KB_KEY_S,'s'
    .set KB_KEY_T,'t'
    .set KB_KEY_U,'u'
    .set KB_KEY_V,'v'
    .set KB_KEY_W,'w'
    .set KB_KEY_X,'x'
    .set KB_KEY_Y,'y'
    .set KB_KEY_Z,'z'
    .set KB_KEY_0,'0'
    .set KB_KEY_1,'1'
    .set KB_KEY_2,'2'
    .set KB_KEY_3,'3'
    .set KB_KEY_4,'4'
    .set KB_KEY_5,'5'
    .set KB_KEY_6,'6'
    .set KB_KEY_7,'7'
    .set KB_KEY_8,'8'
    .set KB_KEY_9,'9'
    .set KB_KEY_BACKQUOTE,'`'
    .set KB_KEY_MINUS,'-'
    .set KB_KEY_EQUAL,'='
    .set KB_KEY_BACKSPACE,0x08
    .set KB_KEY_SPACE ,' '
    .set KB_KEY_ENTER ,0x0a
    .set KB_KEY_TAB   ,0x09
    .set KB_KEY_COMMA ,','
    .set KB_KEY_PERIOD,'.'
    .set KB_KEY_SLASH ,'/'
    .set KB_KEY_SEMICOLON,';'
    .set KB_KEY_QUOTE,0x27
    .set KB_KEY_LEFT_BRACKET ,'['
    .set KB_KEY_RIGHT_BRACKET,']'
    .set KB_KEY_BACKSLASH,0x5c

    ; When the input mode is set to RAW or HALFCOOKED, the following keys can be sent to the
    ; user program to mark which special keys were pressed (or released).
    .set KB_NUMPAD_0     ,0x80
    .set KB_NUMPAD_1     ,0x81
    .set KB_NUMPAD_2     ,0x82
    .set KB_NUMPAD_3     ,0x83
    .set KB_NUMPAD_4     ,0x84
    .set KB_NUMPAD_5     ,0x85
    .set KB_NUMPAD_6     ,0x86
    .set KB_NUMPAD_7     ,0x87
    .set KB_NUMPAD_8     ,0x88
    .set KB_NUMPAD_9     ,0x89
    .set KB_NUMPAD_DOT   ,0x8a
    .set KB_NUMPAD_ENTER ,0x8b
    .set KB_NUMPAD_PLUS  ,0x8c
    .set KB_NUMPAD_MINUS ,0x8d
    .set KB_NUMPAD_MUL   ,0x8e
    .set KB_NUMPAD_DIV   ,0x8f
    .set KB_NUMPAD_LOCK  ,0x90
    .set KB_SCROLL_LOCK  ,0x91
    .set KB_CAPS_LOCK    ,0x92
    .set KB_LEFT_SHIFT   ,0x93
    .set KB_LEFT_ALT     ,0x94
    .set KB_LEFT_CTRL    ,0x95
    .set KB_RIGHT_SHIFT  ,0x96
    .set KB_RIGHT_ALT    ,0x97
    .set KB_RIGHT_CTRL   ,0x98
    .set KB_HOME         ,0x99
    .set KB_END          ,0x9a
    .set KB_INSERT       ,0x9b
    .set KB_DELETE       ,0x9c
    .set KB_PG_DOWN      ,0x9d
    .set KB_PG_UP        ,0x9e
    .set KB_PRINT_SCREEN ,0x9f
    .set KB_UP_ARROW     ,0xa0
    .set KB_DOWN_ARROW   ,0xa1
    .set KB_LEFT_ARROW   ,0xa2
    .set KB_RIGHT_ARROW  ,0xa3
    .set KB_LEFT_SPECIAL ,0xa4

    .set KB_ESC          ,0xf0
    .set KB_F1           ,0xf1
    .set KB_F2           ,0xf2
    .set KB_F3           ,0xf3
    .set KB_F4           ,0xf4
    .set KB_F5           ,0xf5
    .set KB_F6           ,0xf6
    .set KB_F7           ,0xf7
    .set KB_F8           ,0xf8
    .set KB_F9           ,0xf9
    .set KB_F10          ,0xfa
    .set KB_F11          ,0xfb
    .set KB_F12          ,0xfc

    ; When a released event is triggered, this value shall precede the key concerned.
    ; As such, in RAW mode, each key press should at some point generate a release
    ; sequence. For example:
    ;   0x61 [...] 0xFE 0x61
    ;    A   [...] A released
    .set KB_RELEASED     ,0xfe
    .set KB_UNKNOWN      ,0xff

    .endif ; ZOS_KEYBOARD_H
