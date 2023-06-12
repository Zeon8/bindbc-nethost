import std.stdio;
import std.string;
import std.utf;
import std.conv;
static import std.file;
import bindbc.nethost;
import bindbc.nethost.nethost_dynamic;

void loadWithNethost()
{
    if(!loadNethost())
        throw new Exception("Failed to load nethost.dll");
    
    size_t size = 256;
    char_t* buffer = cast(char_t*)new char_t[size];
    int success = get_hostfxr_path(buffer, &size, null);
    if(success !is 0)
        throw new Exception("Failed to get hostfxr path, error code: " ~ success.to!string);
    
    const(char)* path = buffer.to!string().toStringz();
    if(!loadHostfxr(path))
        throw new Exception("Failed to load hostfxr");
}

void main()
{
    loadWithNethost();

    hostfxr_handle ctx;
    int success = hostfxr_initialize_for_runtime_config("DotNetLib/bin/Debug/net7.0/DotNetLib.runtimeconfig.json", 
        null, &ctx);
    if(success !is 0) 
        throw new Exception("Failed to initialize, error code: " ~ success.to!string);
    
    load_assembly_and_get_function_pointer_fn getFunctionPointer;
    success = hostfxr_get_runtime_delegate(ctx, hostfxr_delegate_type.hdt_load_assembly_and_get_function_pointer, 
        cast(void**)&getFunctionPointer);
    if(success !is 0)
        throw new Exception("Failed to get delegate: load_assembly_and_get_function_pointer, error code: " ~ success.to!string);

    netFunction func;
    success = getFunctionPointer("DotNetLib/bin/Debug/net7.0/DotNetLib.dll", "DotNetLib.Lib, DotNetLib", "Main",
        UnmanagedCallersOnly, null, cast(void**)&func);
    if(success !is 0)
        throw new Exception("Failed to get function pointer for DotNetLib.Lib:Main, error code: " ~ success.to!string);

    func();

    if(hostfxr_close(ctx))
        throw new Exception("Failed to close runtime, error code: " ~ success.to!string);
}

alias netFunction = extern(C) void function();