module bindbc.hostfxr.types;

enum NethostSupport {
    noLibrary,
    badLibrary,
    nethost
}

enum HostfxrSupport {
    noLibrary,
    badLibrary,
    hostfxr
}

version(Windows)
    alias char_t = const(wchar);
else
    alias char_t = immutable(char);

public enum UnmanagedCallersOnly = cast(char_t*)-1;

enum hostfxr_delegate_type
{
    hdt_com_activation,
    hdt_load_in_memory_assembly,
    hdt_winrt_activation,
    hdt_com_register,
    hdt_com_unregister,
    hdt_load_assembly_and_get_function_pointer,
    hdt_get_function_pointer,
    hdt_load_assembly,
    hdt_load_assembly_bytes,
}

alias hostfxr_handle = void*;

struct hostfxr_initialize_parameters
{
    size_t size = hostfxr_initialize_parameters.sizeof;
    char_t* host_path;
    char_t* dotnet_root;
}

struct hostfxr_dotnet_environment_sdk_info
{
    size_t size;
    char_t* _version;
    char_t* path;
}

struct hostfxr_dotnet_environment_framework_info
{
    size_t size;
    char_t* name;
    char_t* _version;
    char_t* path;
}

struct hostfxr_dotnet_environment_info
{
    size_t size;

    char_t* hostfxr_version;
    char_t* hostfxr_commit_hash;

    size_t sdk_count;
    hostfxr_dotnet_environment_sdk_info* sdks;

    size_t framework_count;
    hostfxr_dotnet_environment_framework_info* frameworks;
}

struct get_hostfxr_parameters {
    size_t size;
    const char_t* assembly_path;
    const char_t* dotnet_root;
}