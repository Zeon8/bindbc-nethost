module bindbc.nethost.nethost_dynamic;
import bindbc.nethost.types;
import bindbc.loader;

alias get_hostfxr_path_func = extern(C) int function(char_t* buffer,
    size_t* buffer_size, const get_hostfxr_parameters* parameters);

get_hostfxr_path_func get_hostfxr_path;

bool loadNethost(const(char)* libName)
{
    SharedLib lib = load(libName);
    if(lib is invalidHandle)
        return false;
    
    bindSymbol(lib, cast(void**)&get_hostfxr_path, "get_hostfxr_path");

    return true;
}

bool loadNethost()
{
    version(Windows)
        return loadNethost("nethost.dll");
    else version(linux)
        return loadNethost("libnethost.so");
    else version(OSX)
        return loadNethost("libnethost.dylib");
    else
        throw new Exception("Unsupported platform");
}