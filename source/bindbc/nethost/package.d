module bindbc.nethost;
import bindbc.loader;

public import bindbc.nethost.types;
public import bindbc.nethost.functions;
public import bindbc.nethost.delegates;

bool loadHostfxr(const(char)* libName)
{
    SharedLib lib = load(libName);
    if (lib == invalidHandle)
        return false;
    
    bindSymbol(lib, cast(void**)&hostfxr_initialize_for_dotnet_command_line, "hostfxr_initialize_for_dotnet_command_line");
    bindSymbol(lib, cast(void**)&hostfxr_initialize_for_runtime_config, "hostfxr_initialize_for_runtime_config");
    bindSymbol(lib, cast(void**)&hostfxr_get_runtime_delegate, "hostfxr_get_runtime_delegate");
    bindSymbol(lib, cast(void**)&hostfxr_get_runtime_property_value, "hostfxr_get_runtime_property_value");
    bindSymbol(lib, cast(void**)&hostfxr_set_runtime_property_value, "hostfxr_set_runtime_property_value");
    bindSymbol(lib, cast(void**)&hostfxr_get_runtime_properties, "hostfxr_get_runtime_properties");
    bindSymbol(lib, cast(void**)&hostfxr_run_app, "hostfxr_run_app");
    bindSymbol(lib, cast(void**)&hostfxr_get_runtime_delegate, "hostfxr_get_runtime_delegate");
    bindSymbol(lib, cast(void**)&hostfxr_close, "hostfxr_close");
    bindSymbol(lib, cast(void**)&hostfxr_get_dotnet_environment_info, "hostfxr_get_dotnet_environment_info");
    // bindSymbol(cast(void**)&hostfxr_get_dotnet_environment_info_result, "hostfxr_get_dotnet_environment_info_result");

    return true;
}

