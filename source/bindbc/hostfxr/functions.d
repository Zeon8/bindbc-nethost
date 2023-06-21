module bindbc.hostfxr.functions;
import bindbc.hostfxr.types;

__gshared
{
    hostfxr_initialize_for_dotnet_command_line_fn hostfxr_initialize_for_dotnet_command_line;
    hostfxr_initialize_for_runtime_config_fn hostfxr_initialize_for_runtime_config;
    hostfxr_get_runtime_property_value_fn hostfxr_get_runtime_property_value;
    hostfxr_set_runtime_property_value_fn hostfxr_set_runtime_property_value;
    hostfxr_get_runtime_properties_fn  hostfxr_get_runtime_properties;
    hostfxr_run_app_fn hostfxr_run_app;
    hostfxr_get_runtime_delegate_fn hostfxr_get_runtime_delegate;
    hostfxr_close_fn hostfxr_close;
    hostfxr_get_dotnet_environment_info_fn hostfxr_get_dotnet_environment_info;
}

extern(C) @nogc nothrow:

alias hostfxr_initialize_for_dotnet_command_line_fn = int function(
    int argc, char_t** argv, hostfxr_initialize_parameters* parameters,
    hostfxr_handle* host_context_handle);

alias hostfxr_initialize_for_runtime_config_fn = int function(
    char_t* runtime_config_path,
    hostfxr_initialize_parameters* parameters,
    hostfxr_handle* host_context_handle);

alias hostfxr_get_runtime_property_value_fn = int function(
    hostfxr_handle host_context_handle,
    char_t* name,
    /*out*/ char_t** value);

alias hostfxr_set_runtime_property_value_fn = int function(
    hostfxr_handle host_context_handle,
    char_t* name,
    char_t* value);

alias hostfxr_get_runtime_properties_fn = int function(
    hostfxr_handle host_context_handle,
    /*inout*/ size_t* count,
    /*out*/ char_t** keys,
    /*out*/ char_t** values);

alias hostfxr_run_app_fn = int function(hostfxr_handle host_context_handle);

alias hostfxr_get_runtime_delegate_fn = int function(
    hostfxr_handle host_context_handle,
    hostfxr_delegate_type type,
    /*out*/ void** deleg);

alias hostfxr_close_fn = int function(hostfxr_handle host_context_handle);

alias hostfxr_get_dotnet_environment_info_result_fn = void function(
    hostfxr_dotnet_environment_info* info,
    void* result_context);

alias hostfxr_get_dotnet_environment_info_fn = int function(
    char_t* dotnet_root,
    void* reserved,
    hostfxr_get_dotnet_environment_info_result_fn result,
    void* result_context);

