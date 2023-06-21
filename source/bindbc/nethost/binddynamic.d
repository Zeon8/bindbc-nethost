module bindbc.nethost.binddynamic;
import bindbc.hostfxr.types;
import bindbc.loader;

__gshared get_hostfxr_path_func get_hostfxr_path;

private SharedLib lib;

@nogc nothrow:

extern(C)
{
    alias get_hostfxr_path_func =  int function(char_t* buffer,
        size_t* buffer_size, const get_hostfxr_parameters* parameters);
}

NethostSupport loadNethost(const(char)* libName)
{
    lib = load(libName);
    if(lib is invalidHandle)
        return NethostSupport.noLibrary;

    size_t errCount = errorCount();

    bindSymbol(lib, cast(void**)&get_hostfxr_path, "get_hostfxr_path");

    if(errorCount() != errCount) 
        return NethostSupport.badLibrary;

    return NethostSupport.nethost;
}

NethostSupport loadNethost()
{
    version(Windows)
        return loadNethost("nethost.dll");
    else version(linux)
        return loadNethost("./libnethost.so");
    else version(OSX)
        return loadNethost("./libnethost.dylib");
    else
        return NethostSupport.noLibrary;
}

void unloadNethost()
{
    if(lib != invalidHandle)
        unload(lib);
}