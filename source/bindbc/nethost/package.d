module bindbc.nethost;

version(BindBC_Static) version = BindNethost_Static;
version(BindNethost_Static)
    public import bindbc.nethost.bindstatic;
else
    public import bindbc.nethost.binddynamic;