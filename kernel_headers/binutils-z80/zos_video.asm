
; SPDX-FileCopyrightText: 2023 Zeal 8-bit Computer <contact@zeal8bit.com>
;
; SPDX-License-Identifier: Apache-2.0

    .ifndef ZOS_VIDEO_H
    .set ZOS_VIDEO_H, 0

    ; This file represents the minimal interface for a video driver that supports
    ; text mode. It is not mandatory to support all the IOCTL commands presented
    ; below. If any is not supported, the driver shall return ERR_NOT_SUPPORTED

    ; IOCTL commands the driver should implement

    ; Get the video driver capabilities, such as the supported modes, the supported
    ; colors, scrolling, etc...
    ; TODO: Define the attributes.
    .set CMD_GET_ATTR, 0        ; See attribute structure

    ; Get the area bounds of the current display mode
    ; Parameter:
    ;   DE - Address of area_t structure (defined below)
    ;        It will be filled by the driver.
    .set CMD_GET_AREA, 1

    ; Get the current position (X,Y) of the cursor. They represent an index,
    ; so they start at 0.
    ; Parameter:
    ;   DE - Address of a 2-byte array. First byte shall be filled with X, second
    ;        byte shall be filled with Y coordinate.
    .set CMD_GET_CURSOR_XY, 2

    ; Set the (non-constant) attributes.
    .set CMD_SET_ATTR, 3

    ; Set the (X,Y) position of the cursor. If the given coordinate is out of bounds,
    ; the driver can either return an error or accept it and adjust it to the end
    ; of line/column/screen.
    ; Parameters:
    ;   D - X coordinate
    ;   E - Y coordinate
    .set CMD_SET_CURSOR_XY, 4

    ; Set the current background and foreground color for the text that is going to
    ; be written. This does NOT affect the text already written. The colors must be
    ; taken from the TEXT_COLOR_* group defined below.
    ; If a color is not supported, the driver can either return an error, or take a
    ; color similar to the one requested.
    ; Parameters:
    ;   D - Background color
    ;   E - Foreground color
    .set CMD_SET_COLORS, 5

    ; Clear the screen and reposition the cursor at the top left.
    .set CMD_CLEAR_SCREEN, 6

    ; Number of commands above
    .set CMD_COUNT, 7

    ; List of colors to pass to CMD_SET_COLORS command.
    ; This corresponds to the 4-bit VGA palette.
    .set TEXT_COLOR_BLACK,          0x0
    .set TEXT_COLOR_DARK_BLUE,      0x1
    .set TEXT_COLOR_DARK_GREEN,     0x2
    .set TEXT_COLOR_DARK_CYAN,      0x3
    .set TEXT_COLOR_DARK_RED,       0x4
    .set TEXT_COLOR_DARK_MAGENTA,   0x5
    .set TEXT_COLOR_BROWN,          0x6
    .set TEXT_COLOR_LIGHT_GRAY,     0x7
    .set TEXT_COLOR_DARK_GRAY,      0x8
    .set TEXT_COLOR_BLUE,           0x9
    .set TEXT_COLOR_GREEN,          0xa
    .set TEXT_COLOR_CYAN,           0xb
    .set TEXT_COLOR_RED,            0xc
    .set TEXT_COLOR_MAGENTA,        0xd
    .set TEXT_COLOR_YELLOW,         0xe
    .set TEXT_COLOR_WHITE,          0xf

    ; area_t structure, used when getting the current mode area
    .set area_width_t,  0      ; Width of the screen in the current mode
    .set area_height_t, 1      ; Height of the screen in the current mode
    .set area_count_t,  2       ; Number of entities on-screen (usually, width * height)
    .set area_end_t,    4


    .endif ; ZOS_VIDEO_H