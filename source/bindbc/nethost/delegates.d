module bindbc.nethost.delegates;
import bindbc.nethost.types;

alias load_assembly_and_get_function_pointer_fn = extern(C) int function(
    char_t* assemblyPath, char_t* typeName, char_t* methodName, 
    char_t* delegateTypeName, void* reserved, void** deleg);

alias component_entry_point_fn = int function(void *arg, int arg_size_in_bytes);

alias get_function_pointer_fn = extern(C) int function(
    char_t* type_name, char_t* method_name,        
    char_t* delegate_type_name, void* load_context,       
    void* reserved, void ** deleg);

alias load_assembly_fn = int function(
    char_t* assembly_path,
    void* load_context,     
    void* reserved);

alias load_assembly_bytes_fn = int function(
    void* assembly_bytes,
    size_t assembly_bytes_len,
    void* symbols_bytes,
    size_t symbols_bytes_len,
    void* load_context,
    void* reserved);