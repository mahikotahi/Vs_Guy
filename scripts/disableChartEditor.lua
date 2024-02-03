local ffi = require("ffi")  -- Load FFI module (instance)

local user32 = ffi.load("user32")   -- Load User32 DLL handle

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
    MB_ICONINFORMATION = 0x00000040L
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
]]) -- Define C -> Lua interpretation

con = false

function onCreatePost()

    con = stringStartsWith(songName, 'God Guy') or songName =='Cyster'

    if con == true then
        setProperty('debugKeysChart', nil); -- prevents key from doing anything
    end

end

function onUpdate()

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN')then
        if con == true then
            user32.MessageBoxA(nil, 'You cannot escape my wrath.', 'Cysterlosal', ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
            loadSong('tutorial', 0)
        end
        if songName =='third-wheel' then
            user32.MessageBoxA(nil, 'CHEATER.', 'Cyster', ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)
        end
    end

end