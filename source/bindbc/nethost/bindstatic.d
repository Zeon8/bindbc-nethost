module bindbc.nethost.bindstatic;
import bindbc.hostfxr.types;

extern(C) int get_hostfxr_path(char_t* buffer,
    size_t* buffer_size, const get_hostfxr_parameters *parameters);