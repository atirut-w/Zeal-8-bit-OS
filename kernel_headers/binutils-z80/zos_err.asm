; SPDX-FileCopyrightText: 2023 Zeal 8-bit Computer <contact@zeal8bit.com>
;
; SPDX-License-Identifier: Apache-2.0

    .ifndef ZOS_ERR_HEADER
    .set ZOS_ERR_HEADER, 0

    ; DEFGROUP
    ; {
    ;     ERR_SUCCESS = 0,
    ;     ERR_FAILURE,
    ;     ERR_NOT_IMPLEMENTED,
    ;     ERR_NOT_SUPPORTED,
    ;     ERR_NO_SUCH_ENTRY,
    ;     ERR_INVALID_SYSCALL,
    ;     ERR_INVALID_PARAMETER,
    ;     ERR_INVALID_VIRT_PAGE,
    ;     ERR_INVALID_PHYS_ADDRESS,
    ;     ERR_INVALID_OFFSET,
    ;     ERR_INVALID_NAME,
    ;     ERR_INVALID_PATH,
    ;     ERR_INVALID_FILESYSTEM,
    ;     ERR_INVALID_FILEDEV,
    ;     ERR_PATH_TOO_LONG,
    ;     ERR_ALREADY_EXIST,
    ;     ERR_ALREADY_OPENED,
    ;     ERR_ALREADY_MOUNTED,
    ;     ERR_READ_ONLY,
    ;     ERR_BAD_MODE,
    ;     ERR_CANNOT_REGISTER_MORE,
    ;     ERR_NO_MORE_ENTRIES,
    ;     ERR_NO_MORE_MEMORY,
    ;     ERR_NOT_A_DIR,
    ;     ERR_NOT_A_FILE,
    ;     ERR_ENTRY_CORRUPTED,
    ;     ERR_DIR_NOT_EMPTY,
    ; }

    .set ERR_SUCCESS, 0
    .set ERR_FAILURE, 1
    .set ERR_NOT_IMPLEMENTED, 2
    .set ERR_NOT_SUPPORTED, 3
    .set ERR_NO_SUCH_ENTRY, 4
    .set ERR_INVALID_SYSCALL, 5
    .set ERR_INVALID_PARAMETER, 6
    .set ERR_INVALID_VIRT_PAGE, 7
    .set ERR_INVALID_PHYS_ADDRESS, 8
    .set ERR_INVALID_OFFSET, 9
    .set ERR_INVALID_NAME, 10
    .set ERR_INVALID_PATH, 11
    .set ERR_INVALID_FILESYSTEM, 12
    .set ERR_INVALID_FILEDEV, 13
    .set ERR_PATH_TOO_LONG, 14
    .set ERR_ALREADY_EXIST, 15
    .set ERR_ALREADY_OPENED, 16
    .set ERR_ALREADY_MOUNTED, 17
    .set ERR_READ_ONLY, 18
    .set ERR_BAD_MODE, 19
    .set ERR_CANNOT_REGISTER_MORE, 20
    .set ERR_NO_MORE_ENTRIES, 21
    .set ERR_NO_MORE_MEMORY, 22
    .set ERR_NOT_A_DIR, 23
    .set ERR_NOT_A_FILE, 24
    .set ERR_ENTRY_CORRUPTED, 25
    .set ERR_DIR_NOT_EMPTY, 26

    .endif ; ZOS_ERR_HEADER
